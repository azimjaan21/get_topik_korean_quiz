import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;

  ResultScreen({required this.totalQuestions, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Questions: $totalQuestions',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Correct Answers: $correctAnswers',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the quiz screen
              },
              child: Text('Back to Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}