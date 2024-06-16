import 'dart:math';

import 'package:get_topik_korean_quiz/databases/book2_data.dart';
import 'package:get_topik_korean_quiz/screens/home/result_screen/result_screen.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:get_topik_korean_quiz/widgets/slider_to_quiz.dart';

class RandomQuizScreen extends StatefulWidget {
  const RandomQuizScreen({super.key});

  @override
  _RandomQuizScreenState createState() => _RandomQuizScreenState();
}

class _RandomQuizScreenState extends State<RandomQuizScreen> {
  late double unitNumber; // Selected unit number
  late List<QuizTest> unitQuizData; // Quiz data for the selected unit
  int currentQuestionIndex = 0;
  bool isAnswered = false;
  bool isCorrect = false;
  int selectedOptionIndex = -1;
  int correctAnswers = 0; // Track correct answers

  // List of available unit numbers
  List<double> availableUnitNumbers = [
    2.1,
    2.2,
    2.3,
    3.1,
    3.2,
    3.3,
    4.1,
    4.2,
    4.3,
    5.1,
    5.2,
    5.3
  ];

  @override
  void initState() {
    super.initState();

    // Randomly select a unit number
    unitNumber = _getRandomUnitNumber();

    // Combine quiz data from book1 and book2
    List<QuizTest> combinedQuizData = [];
    combinedQuizData.addAll(book1QuizData);
    combinedQuizData.addAll(book2QuizData);

    // Shuffle the combined list to randomize the order
    combinedQuizData.shuffle();

    // Select quiz data for the selected unit number
    unitQuizData = combinedQuizData
        .where((quiz) => quiz.unitNumber == unitNumber)
        .toList();
  }

  // Function to get a random unit number from availableUnitNumbers
  double _getRandomUnitNumber() {
    Random random = Random();
    return availableUnitNumbers[random.nextInt(availableUnitNumbers.length)];
  }

  void checkAnswer(int selectedOptionIndex) {
    setState(() {
      this.selectedOptionIndex = selectedOptionIndex;
      isAnswered = true;
      isCorrect = selectedOptionIndex ==
          unitQuizData[currentQuestionIndex].correctOptionIndex;
      if (isCorrect) {
        correctAnswers++; // Increment correct answers count
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < unitQuizData.length - 1) {
        currentQuestionIndex++;
        isAnswered = false;
        isCorrect = false;
        selectedOptionIndex = -1;
      } else {
        showResult();
      }
    });
  }

  void showResult() {
    int totalQuestions = unitQuizData.length;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          totalQuestions: totalQuestions,
          correctAnswers: correctAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (unitQuizData.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Placeholder for loading state
        ),
      );
    }

    QuizTest currentQuestion = unitQuizData[currentQuestionIndex];
    double progress = (currentQuestionIndex + 1) / unitQuizData.length;
    return Scaffold(
      backgroundColor:
          Colors.grey[300], // Replace with your desired background color
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '무작위 퀴즈',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor:
            AppColors.topBarColor, // Replace with your desired app bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Unit: ${_getUnitName(unitNumber)}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Icon(Icons.keyboard_double_arrow_down_rounded,
                        color: AppColors.topBarColor)
                  ],
                ),
              ),
              CustomLinearProgressIndicator(value: progress),
              10.kH,
              Text(
                "${currentQuestionIndex + 1} / ${unitQuizData.length}",
                style: quizSliderText,
              ),
              20.kH,
              QuizCard(word: currentQuestion.question),
              30.kH,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: currentQuestion.options.asMap().entries.map((entry) {
                  int optionIndex = entry.key;
                  String optionText = entry.value;
                  return ElevatedButton(
                    onPressed:
                        isAnswered ? null : () => checkAnswer(optionIndex),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAnswered
                          ? optionIndex == currentQuestion.correctOptionIndex
                              ? Colors.green
                              : selectedOptionIndex == optionIndex
                                  ? Colors.red
                                  : null
                          : null,
                    ),
                    child: Text(optionText, style: quizOpText),
                  );
                }).toList(),
              ),
              20.kH,
              if (isAnswered)
                isCorrect
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            size: 28.0,
                            color: Colors.green,
                          ),
                          Text(
                            '맞아요',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close,
                                size: 28.0,
                                color: Colors.red,
                              ),
                              Text(
                                '틀려요',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            currentQuestion
                                .options[currentQuestion.correctOptionIndex],
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
              20.kH,
              ElevatedButton(
                onPressed: isAnswered ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.topBarColor),
                child: Text(
                  currentQuestionIndex < unitQuizData.length - 1
                      ? 'Keyingisi'
                      : 'Quizni Tugatish',
                  style: loginText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to get the unit name based on unit number
  String _getUnitName(double unitNumber) {
    String unitName = unitNumber.toString();
    if (unitName.endsWith('.0')) {
      unitName = unitName.substring(0, unitName.length - 2);
    }
    return unitName;
  }
}
