class Quiz {
  int id;
  int unit;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String answer;

  Quiz({
    required this.id,
    required this.unit,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'unit': unit,
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'answer': answer,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'],
      question: map['question'],
      option1: map['option1'],
      option2: map['option2'],
      option3: map['option3'],
      option4: map['option4'],
      answer: map['answer'],
      unit: map['unit'],
    );
  }
}
