class QuizSubmissionResponseModel {
  String? id;
  String? userId;
  String? results;
  double? playTime;
  double? percentile;

  QuizSubmissionResponseModel(
      {this.id, this.userId, this.results, this.playTime, this.percentile});

  QuizSubmissionResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    results = json['results'];
    playTime = json['play_time'];
    percentile = json['percentile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['results'] = results;
    data['play_time'] = playTime;
    data['percentile'] = percentile;
    return data;
  }
}
