class QuizModel {
  final List<Question> questions;

  QuizModel({required this.questions});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      questions: (json['questions'] as List<dynamic>)
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Question {
  final int id;
  final String description;
  final List<Option> options;

  Question({
    required this.id,
    required this.description,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      description: json['description'] as String? ?? '',
      options: (json['options'] as List<dynamic>)
          .map((o) => Option.fromJson(o as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Option {
  final int id;
  final String description; // Changed from 'text' to 'description'
  final bool isCorrect;
  bool isSelected;

  Option({
    required this.id,
    required this.description, // Changed from 'text' to 'description'
    this.isCorrect = false,
    this.isSelected = false,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] as int,
      description:
          json['description'] as String? ?? '', // Mapping 'description'
      isCorrect: json['is_correct'] as bool? ?? false,
    );
  }
}
