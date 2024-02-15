import 'dart:convert';

class QuizQuestionAnswerSetModel {
  String? id;
  String? answer;
  String? choices;
  String? category;
  String? question;

  QuizQuestionAnswerSetModel(
      {this.id, this.answer, this.choices, this.category, this.question});

  QuizQuestionAnswerSetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    choices = json['choices'];
    category = json['category'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    data['choices'] = choices;
    data['category'] = category;
    data['question'] = question;
    return data;
  }

  List<String> getListFromString() {
    List<dynamic> dynamicList = json.decode(choices!);
    return dynamicList.cast<String>();
  }
}
