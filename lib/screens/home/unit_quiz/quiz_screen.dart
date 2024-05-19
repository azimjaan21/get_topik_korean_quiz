// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get_topik_korean_quiz/databases/book1_data.dart';
import 'package:get_topik_korean_quiz/models/quiz.module.dart';
import 'package:get_topik_korean_quiz/screens/home/unit_quiz/result_screen.dart';


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
    unitQuizData = book1QuizData.where((quiz) => quiz.unitNumber == widget.unitNumber).toList();
  }

  void checkAnswer(int selectedOptionIndex) {
    setState(() {
      isAnswered = true;
      isCorrect = selectedOptionIndex == unitQuizData[currentQuestionIndex].correctOptionIndex;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < unitQuizData.length - 1) {
        currentQuestionIndex++;
        isAnswered = false;
        isCorrect = false;
      } else {
        // If all questions are answered, show the result
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Unit ${widget.unitNumber} Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}: ${currentQuestion.question}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: currentQuestion.options.asMap().entries.map((entry) {
                int optionIndex = entry.key;
                String optionText = entry.value;
                return ElevatedButton(
                  onPressed: isAnswered ? null : () => checkAnswer(optionIndex),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAnswered && optionIndex == currentQuestion.correctOptionIndex
                        ? isCorrect ? Colors.green : Colors.red
                        : null,
                  ),
                  child: Text(optionText),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            if (isAnswered)
              isCorrect
                  ? const Text(
                      'Correct!',
                      style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      'Incorrect. Correct answer: ${currentQuestion.options[currentQuestion.correctOptionIndex]}',
                      style: const TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: nextQuestion,
              child: Text(
                currentQuestionIndex < unitQuizData.length - 1 ? 'Next Question' : 'Finish Quiz',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}