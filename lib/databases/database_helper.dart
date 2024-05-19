import 'dart:async';
import 'package:get_topik_korean_quiz/models/quiz.module.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'quiz.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quizzes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        option1 TEXT,
        option2 TEXT,
        option3 TEXT,
        option4 TEXT,
        answer TEXT,
        unit INTEGER
      )
    ''');
  }

  Future<int> insertQuiz(Quiz quiz) async {
    final db = await database;
    return await db.insert('quizzes', quiz.toMap());
  }

  Future<List<Quiz>> getQuizzesSortedByUnit() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('quizzes', orderBy: 'unit ASC, id ASC');

    return List.generate(maps.length, (i) {
      return Quiz.fromMap(maps[i]);
    });
  }

  Future<int> updateQuiz(Quiz quiz) async {
    final db = await database;
    return await db.update('quizzes', quiz.toMap(), where: 'id = ?', whereArgs: [quiz.id]);
  }

  Future<int> deleteQuiz(int id) async {
    final db = await database;
    return await db.delete('quizzes', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteDatabase(String path) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'quiz.db');
    await deleteDatabase(path);
  }
}
