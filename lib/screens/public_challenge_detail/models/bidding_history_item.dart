import 'package:skills_pe/screens/public_challenge_detail/models/bidding_options.dart';

class BiddingHistoryItem {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? challengeId;
  String? userId;
  int? bidAmount;
  BidOptions? bidOption;
  int? bidQty;
  int? gainAmount;
  ApprovedBidInfo? approvedBidInfo;
  ApprovedBidInfo? unapprovedBidInfo;

  BiddingHistoryItem(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.challengeId,
      this.userId,
      this.bidAmount,
      this.bidOption,
      this.bidQty,
      this.gainAmount,
      this.approvedBidInfo,
      this.unapprovedBidInfo});

  BiddingHistoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    challengeId = json['challenge_id'];
    userId = json['user_id'];
    bidAmount = json['bid_amount'];
    bidOption = json['bid_option'] != null
        ? BidOptions.fromJson(json['bid_option'])
        : null;
    bidQty = json['bid_qty'];
    gainAmount = json['gain_amount'];
    approvedBidInfo = json['approved_bid_info'] != null
        ? ApprovedBidInfo.fromJson(json['approved_bid_info'])
        : null;
    unapprovedBidInfo = json['unapproved_bid_info'] != null
        ? ApprovedBidInfo.fromJson(json['unapproved_bid_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['challenge_id'] = challengeId;
    data['user_id'] = userId;
    data['bid_amount'] = bidAmount;
    if (bidOption != null) {
      data['bid_option'] = bidOption!.toJson();
    }
    data['bid_qty'] = bidQty;
    data['gain_amount'] = gainAmount;
    if (approvedBidInfo != null) {
      data['approved_bid_info'] = approvedBidInfo!.toJson();
    }
    if (unapprovedBidInfo != null) {
      data['unapproved_bid_info'] = unapprovedBidInfo!.toJson();
    }
    return data;
  }
}

class ApprovedBidInfo {
  double? ratePerQty;
  int? amount;

  ApprovedBidInfo({this.ratePerQty, this.amount});

  ApprovedBidInfo.fromJson(Map<String, dynamic> json) {
    ratePerQty = json['rate_per_qty'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate_per_qty'] = ratePerQty;
    data['amount'] = amount;
    return data;
  }
}
