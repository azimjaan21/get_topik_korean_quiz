import 'package:get_topik_korean_quiz/databases/database_helper.dart';
import 'package:get_topik_korean_quiz/models/quiz.module.dart';



class QuizService {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> loadQuizzes(List<Quiz> quizzes) async {
    const batchSize = 100;
    for (int i = 0; i < quizzes.length; i += batchSize) {
      final batch = quizzes.skip(i).take(batchSize).toList();
      await _insertBatch(batch);
    }
  }

  Future<void> _insertBatch(List<Quiz> quizzes) async {
    for (Quiz quiz in quizzes) {
      await dbHelper.insertQuiz(quiz);
    }
  }
}

List<Quiz> getSampleQuizzes() {
  return [
    Quiz(
      id:1,
      question: 'What is the capital of South Korea?',
      option1: 'Seoul',
      option2: 'Busan',
      option3: 'Incheon',
      option4: 'Daegu',
      answer: 'Seoul',
      unit: 1,
    ),
    Quiz(
      id:2,
      question: 'What is the Korean word for "Hello"?',
      option1: 'Annyeong',
      option2: 'Gamsahamnida',
      option3: 'Saranghae',
      option4: 'Juseyo',
      answer: 'Annyeong',
      unit: 1,
    ),
    // Add more quizzes with appropriate units here
  ];
}
