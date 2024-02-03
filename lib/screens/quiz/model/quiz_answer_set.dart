import 'dart:convert';

class QuizAnswerSet {
  final String answer;
  final String id;

  QuizAnswerSet({required this.answer, required this.id});

  // @override
  // String toString() {
  //   return '{"id":"$id", "answer":"$answer"}';
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'answer': answer,
    };
  }

  static String listToJson(List<QuizAnswerSet> quizAnswerSet) {
    List<Map<String, dynamic>> objectList =
        quizAnswerSet.map((obj) => obj.toJson()).toList();
    return jsonEncode(objectList);
  }
}
