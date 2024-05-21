import 'package:get_topik_korean_quiz/databases/book2_data.dart';
import 'package:get_topik_korean_quiz/screens/home/result_screen/result_screen.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:get_topik_korean_quiz/widgets/slider_to_quiz.dart';

class QuizScreen2 extends StatefulWidget {
  final double unitNumber;

  const QuizScreen2({super.key, required this.unitNumber});

  @override
  _QuizScreen2State createState() => _QuizScreen2State();
}

class _QuizScreen2State extends State<QuizScreen2> {
  List<QuizTest> unitQuizData = [];
  int currentQuestionIndex = 0;
  bool isAnswered = false;
  bool isCorrect = false;
  int selectedOptionIndex = -1;
  int correctAnswers = 0; // Track correct answers

  @override
  void initState() {
    super.initState();
    unitQuizData = book2QuizData
        .where((quiz) => quiz.unitNumber == widget.unitNumber)
        .toList();
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
    QuizTest currentQuestion = unitQuizData[currentQuestionIndex];
    double progress = (currentQuestionIndex + 1) / unitQuizData.length;
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
