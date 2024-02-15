class QuizSubmissionRequestModel {
  //SubmissionDetails? submissionDetails;
  Meta? meta;

  QuizSubmissionRequestModel({required this.meta});

  QuizSubmissionRequestModel.fromJson(Map<String, dynamic> json) {
    // submissionDetails = json['submission_details'] != null
    //     ? SubmissionDetails.fromJson(json['submission_details'])
    //     : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (submissionDetails != null) {
    //   data['submission_details'] = submissionDetails!.toJson();
    // }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

// class SubmissionDetails {

// 	SubmissionDetails({});

// 	SubmissionDetails.fromJson(Map<String, dynamic> json);

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		return data;
// 	}
// }

class Meta {
  String? quizQA;

  Meta({this.quizQA});

  Meta.fromJson(Map<String, dynamic> json) {
    quizQA = json['quizQA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quizQA'] = quizQA;
    return data;
  }
}
