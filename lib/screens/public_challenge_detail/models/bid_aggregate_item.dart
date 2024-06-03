class BidAggregateItem {
  double? totalApprovedAmount;
  double? totalGainAmount;
  double? totalBidQtys;
  String? label;

  BidAggregateItem(
      {this.totalApprovedAmount,
      this.totalGainAmount,
      this.totalBidQtys,
      this.label});

  BidAggregateItem.fromJson(Map<String, dynamic> json) {
    totalApprovedAmount = json['total_approved_amount'];
    totalGainAmount = json['total_gain_amount'];
    totalBidQtys = json['total_bid_qtys'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_approved_amount'] = totalApprovedAmount;
    data['total_gain_amount'] = totalGainAmount;
    data['total_bid_qtys'] = totalBidQtys;
    data['label'] = label;
    return data;
  }
}
