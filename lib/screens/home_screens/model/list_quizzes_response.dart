class QuizzesListResponse {
  String? id;
  String? quizType;
  String? name;
  String? description;
  double? duration;
  String? banner;
  String? format;
  String? category;
  int? noOfQuestions;
  double? participationFee;
  int? pricePool;
  String? scheduledTime;
  String? scheduledExpiry;
  String? scheduledFrequency;
  String? status;
  bool? active;
  bool? isParticipant;

  QuizzesListResponse(
      {this.id,
      this.quizType,
      this.name,
      this.description,
      this.duration,
      this.banner,
      this.format,
      this.category,
      this.noOfQuestions,
      this.participationFee,
      this.pricePool,
      this.scheduledTime,
      this.scheduledExpiry,
      this.scheduledFrequency,
      this.status,
      this.active,
      this.isParticipant});

  QuizzesListResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizType = json['quiz_type'];
    name = json['name'];
    description = json['description'];
    duration = json['duration']?.toDouble();
    banner = json['banner'];
    format = json['format'];
    category = json['category'];
    noOfQuestions = json['no_of_questions'];
    participationFee = json['participation_fee']?.toDouble();
    pricePool = json['price_pool'];
    scheduledTime = json['scheduled_time'];
    scheduledExpiry = json['scheduled_expiry'];
    scheduledFrequency = json['scheduled_frequency'];
    status = json['status'];
    active = json['active'];
    isParticipant = json['is_participant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['quiz_type'] = quizType;
    data['name'] = name;
    data['description'] = description;
    data['duration'] = duration;
    data['banner'] = banner;
    data['format'] = format;
    data['category'] = category;
    data['no_of_questions'] = noOfQuestions;
    data['participation_fee'] = participationFee;
    data['price_pool'] = pricePool;
    data['scheduled_time'] = scheduledTime;
    data['scheduled_expiry'] = scheduledExpiry;
    data['scheduled_frequency'] = scheduledFrequency;
    data['status'] = status;
    data['active'] = active;
    data['is_participant'] = isParticipant;
    return data;
  }
}
