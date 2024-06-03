class ParticipantsRequest {
  final String type;
  final String status;

  const ParticipantsRequest({this.type = 'MOTIVATOR', this.status = 'ACTIVE'});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}
