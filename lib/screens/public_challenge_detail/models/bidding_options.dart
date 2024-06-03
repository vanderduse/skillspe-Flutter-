class BidOptions {
  String? userId;
  String? lastName;
  String? firstName;
  String? participantId;
  String? label;
  double? value;
  double? bidValue;

  BidOptions(
      {this.userId,
      this.lastName,
      this.firstName,
      this.participantId,
      this.label,
      this.value,
      this.bidValue});

  BidOptions.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    participantId = json['participant_id'];
    label = json['label'];
    value = json['value'];
    bidValue = json['bid_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['participant_id'] = participantId;
    data['label'] = label;
    data['value'] = value;
    data['bid_value'] = bidValue;
    return data;
  }
}
