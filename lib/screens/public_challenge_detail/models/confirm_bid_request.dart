import 'package:skills_pe/screens/public_challenge_detail/models/bidding_options.dart';

class ConfirmBidRequest {
  int? bidAmount;
  BidOptions? bidOption;

  ConfirmBidRequest({this.bidAmount, this.bidOption});

  ConfirmBidRequest.fromJson(Map<String, dynamic> json) {
    bidAmount = json['bid_amount'];
    bidOption = json['bid_option'] != null
        ? BidOptions.fromJson(json['bid_option'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bid_amount'] = bidAmount;
    if (bidOption != null) {
      data['bid_option'] = bidOption!.toJson();
    }
    return data;
  }
}
