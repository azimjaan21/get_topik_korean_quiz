import 'package:flutter/material.dart';
import 'package:get_topik_korean_quiz/databases/database_helper.dart';
import 'package:get_topik_korean_quiz/models/quiz.module.dart';

class UnitQuizScreen extends StatefulWidget {
  const UnitQuizScreen({super.key});

  @override
  _UnitQuizScreenState createState() => _UnitQuizScreenState();
}

class _UnitQuizScreenState extends State<UnitQuizScreen> {
  final dbHelper = DatabaseHelper();
  late Future<List<Quiz>> _quizzes;
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _showResult = false;
  bool _answerSelected = false;
  bool _correctAnswerSelected = false;

  @override
  void initState() {
    super.initState();
    _quizzes = dbHelper.getQuizzesSortedByUnit();
  }

  void _checkAnswer(String selectedOption, String correctAnswer) {
    setState(() {
      _answerSelected = true;
      _correctAnswerSelected = selectedOption == correctAnswer;
      if (_correctAnswerSelected) {
        _score++;
      }
    });
  }

  void _nextQuestion(int quizLength) {
    setState(() {
      _answerSelected = false;
      _correctAnswerSelected = false;
      if (_currentQuestionIndex < quizLength - 1) {
        _currentQuestionIndex++;
      } else {
        _showResult = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: FutureBuilder<List<Quiz>>(
        future: _quizzes,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final quizzes = snapshot.data!;
          if (_showResult) {
            return Center(
              child: Text('Quiz Completed! Your score: $_score/${quizzes.length}'),
            );
          }
          final quiz = quizzes[_currentQuestionIndex];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  quiz.question,
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(height: 16.0),
                _buildOptionButton(quiz.option1, quiz.answer),
                _buildOptionButton(quiz.option2, quiz.answer),
                _buildOptionButton(quiz.option3, quiz.answer),
                _buildOptionButton(quiz.option4, quiz.answer),
                if (_answerSelected)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () => _nextQuestion(quizzes.length),
                      child: Text('Next Question'),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOptionButton(String option, String correctAnswer) {
    Color buttonColor() {
      if (!_answerSelected) {
        return Colors.blue;
      } else if (option == correctAnswer) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }

    return ElevatedButton(
      onPressed: () {
        if (!_answerSelected) {
          _checkAnswer(option, correctAnswer);
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: buttonColor()),
      child: Text(option),
    );
  }
}
