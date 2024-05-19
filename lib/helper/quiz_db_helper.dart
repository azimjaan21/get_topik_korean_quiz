import 'package:get_topik_korean_quiz/models/quiz.module.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class QuizDatabaseHelper {
  late Database _database;

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'quiz_database.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE quiz_tests(id INTEGER PRIMARY KEY, unitNumber REAL, question TEXT, options TEXT, correctOptionIndex INTEGER)",
      );
    }, version: 1);
  }

  Future<void> insertQuizTest(QuizTest quizTest) async {
    final db = await database;
    await db.insert(
      'quiz_tests',
      quizTest.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<QuizTest>> getQuizTests() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('quiz_tests');
    return List.generate(maps.length, (i) {
      return QuizTest.fromMap(maps[i]);
    });
  }
}
