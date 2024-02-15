class QuizInformationResponseModel {
  String? id;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? pricePool;
  String? quizType;
  String? name;
  String? description;
  String? questionSet;
  double? duration;
  String? banner;
  String? format;
  String? category;
  int? noOfQuestions;
  double? participationFee;
  String? scheduledTime;
  String? scheduledFrequency;
  String? status;
  bool? active;

  QuizInformationResponseModel(
      {this.id,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.pricePool,
      this.quizType,
      this.name,
      this.description,
      this.questionSet,
      this.duration,
      this.banner,
      this.format,
      this.category,
      this.noOfQuestions,
      this.participationFee,
      this.scheduledTime,
      this.scheduledFrequency,
      this.status,
      this.active});

  QuizInformationResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pricePool = json['price_pool'];
    quizType = json['quiz_type'];
    name = json['name'];
    description = json['description'];
    questionSet = json['question_set'];
    duration = json['duration'];
    banner = json['banner'];
    format = json['format'];
    category = json['category'];
    noOfQuestions = json['no_of_questions'];
    participationFee = json['participation_fee'];
    scheduledTime = json['scheduled_time'];
    scheduledFrequency = json['scheduled_frequency'];
    status = json['status'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['price_pool'] = pricePool;
    data['quiz_type'] = quizType;
    data['name'] = name;
    data['description'] = description;
    data['question_set'] = questionSet;
    data['duration'] = duration;
    data['banner'] = banner;
    data['format'] = format;
    data['category'] = category;
    data['no_of_questions'] = noOfQuestions;
    data['participation_fee'] = participationFee;
    data['scheduled_time'] = scheduledTime;
    data['scheduled_frequency'] = scheduledFrequency;
    data['status'] = status;
    data['active'] = active;
    return data;
  }
}
