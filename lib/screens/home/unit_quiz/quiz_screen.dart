// ignore_for_file: library_private_types_in_public_api

import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:get_topik_korean_quiz/widgets/slider_to_quiz.dart';

class QuizScreen extends StatefulWidget {
  final double unitNumber;

  const QuizScreen({super.key, required this.unitNumber});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizTest> unitQuizData = [];
  int currentQuestionIndex = 0;
  bool isAnswered = false;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    unitQuizData = book1QuizData
        .where((quiz) => quiz.unitNumber == widget.unitNumber)
        .toList();
  }

  void checkAnswer(int selectedOptionIndex) {
    setState(() {
      isAnswered = true;
      isCorrect = selectedOptionIndex ==
          unitQuizData[currentQuestionIndex].correctOptionIndex;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < unitQuizData.length - 1) {
        currentQuestionIndex++;
        isAnswered = false;
        isCorrect = false;
      } else {
        // If all questions are answered, show the result (azimjaan21)
        showResult();
      }
    });
  }

  void showResult() {
    int totalQuestions = unitQuizData.length;
    int correctAnswers = unitQuizData.where((q) => q.isCorrect).length;
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
    QuizTest currentQuestion = unitQuizData[currentQuestionIndex];
    double progress =
        (currentQuestionIndex + 1) / unitQuizData.length; // #total questions
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar:
          AppBar(toolbarHeight: 10.0, backgroundColor: AppColors.background),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      backgroundColor: isAnswered &&
                              optionIndex == currentQuestion.correctOptionIndex
                          ? isCorrect
                              ? Colors.green
                              : Colors.red
                          : null,
                    ),
                    child: Text(optionText),
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
              isAnswered
                  ? 
                   ElevatedButton(
                      onPressed: nextQuestion,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.topBarColor),
                      child: Text(
                        currentQuestionIndex < unitQuizData.length - 1
                            ? 'Next Question'
                            : 'Finish Quiz',
                        style: loginText,
                      ),
                    ) : ElevatedButton(
                      onPressed: null,
                      child: Text(
                        currentQuestionIndex < unitQuizData.length - 1
                            ? 'Next Question'
                            : 'Finish Quiz',
                        style: loginText,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
