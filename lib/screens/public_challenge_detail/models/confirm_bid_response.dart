class ConfirmBidResponse {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? challengeId;
  String? userId;
  int? bidAmount;
  int? approvedAmount;
  int? bidQty;

  ConfirmBidResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.challengeId,
    this.userId,
    this.bidAmount,
    this.approvedAmount,
    this.bidQty,
  });

  ConfirmBidResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    challengeId = json['challenge_id'];
    userId = json['user_id'];
    bidAmount = json['bid_amount'];
    approvedAmount = json['approved_amount'];
    bidQty = json['bid_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['challenge_id'] = challengeId;
    data['user_id'] = userId;
    data['bid_amount'] = bidAmount;
    data['approved_amount'] = approvedAmount;
    data['bid_qty'] = bidQty;
    return data;
  }
}
