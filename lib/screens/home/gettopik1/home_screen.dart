import 'package:flutter/material.dart';
import 'package:get_topik_korean_quiz/screens/home/unit_quiz/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen(unitNumber: 2.1)),
                );
              },
              child: Text('Unit 2.1'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen(unitNumber: 2.2)),
                );
              },
              child: Text('Unit 2.2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen(unitNumber: 2.3)),
                );
              },
              child: Text('Unit 2.3'),
            ),
          ],
        ),
      ),
    );
  }
}