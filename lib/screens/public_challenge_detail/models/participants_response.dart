// ignore_for_file: prefer_collection_literals, unnecessary_new

class ParticipantsResponse {
  String? id;
  String? createdBy;
  String? updatedBy;
  String? userId;
  String? challengeId;
  String? type;
  String? status;

  ParticipantsResponse(
      {this.id,
      this.createdBy,
      this.updatedBy,
      this.userId,
      this.challengeId,
      this.type,
      this.status});

  ParticipantsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    userId = json['user_id'];
    challengeId = json['challenge_id'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['user_id'] = userId;
    data['challenge_id'] = challengeId;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}
