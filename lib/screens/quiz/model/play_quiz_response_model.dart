class PlayQuizResponseModel {
  String? id;
  String? question;
  String? questionSet;

  PlayQuizResponseModel({this.id, this.question, this.questionSet});

  PlayQuizResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    questionSet = json['question_set'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['question_set'] = questionSet;
    return data;
  }
}
