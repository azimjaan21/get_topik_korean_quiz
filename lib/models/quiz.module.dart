class QuizTest {
  final int id;
  final double unitNumber;
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  QuizTest({
    required this.id,
    required this.unitNumber,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });

  // Convert a QuizTest object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'unitNumber': unitNumber,
      'question': question,
      'options': options.join(','),
      'correctOptionIndex': correctOptionIndex,
    };
  }

  // Convert a Map object into a QuizTest
  static QuizTest fromMap(Map<String, dynamic> map) {
    var optionsList = map['options'].split(',');
    return QuizTest(
      id: map['id'],
      unitNumber: map['unitNumber'],
      question: map['question'],
      options: optionsList,
      correctOptionIndex: map['correctOptionIndex'],
    );
  }

   bool get isCorrect {
    return correctOptionIndex != -1;
  }

}