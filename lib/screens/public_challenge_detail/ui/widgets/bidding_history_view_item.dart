import 'package:flutter/material.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/bidding_history_item.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bidding_history_tag.dart';
import 'package:skills_pe/sharedWidgets/dotted_divider.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/utility.dart';

class BiddingHistoryItemView extends StatelessWidget {
  final BiddingHistoryItem _biddingHistoryItem;
  const BiddingHistoryItemView(this._biddingHistoryItem, {super.key});

  double _getQuantity(int? amount, double? ratePerQty) {
    if (amount != null && ratePerQty != null && ratePerQty != 0) {
      return amount / ratePerQty;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: _biddingHistoryItem.bidOption?.label == YES
                    ? Theme.of(context).primaryColor
                    : const Color.fromRGBO(255, 52, 193, 0.85),
                child: Center(
                  child: Text(
                    '${_biddingHistoryItem.bidOption?.label?.substring(0, 1)}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${_biddingHistoryItem.bidOption?.label}'),
                      const BidingHistoryTag(
                        tag: MATCHED,
                        color: Colors.green,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Qty: ${_biddingHistoryItem.bidQty ?? 0}',
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: HexColor("#3F3F3F"),
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$RUPEE${_biddingHistoryItem.bidAmount}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "+${_biddingHistoryItem.gainAmount ?? 0.0}",
                    style: const TextStyle(color: Colors.green),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          _biddingHistoryItem.unapprovedBidInfo != null
              ? Row(
                  children: [
                    const SizedBox(width: 60),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('Matched',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14)),
                            BidingHistoryTag(
                              tag:
                                  'QTY: ${_getQuantity(_biddingHistoryItem.approvedBidInfo?.amount, _biddingHistoryItem.approvedBidInfo?.ratePerQty).toInt()}',
                              color: Colors.green,
                            ),
                            const Spacer(),
                            Text(
                                '$RUPEE${_biddingHistoryItem.approvedBidInfo?.amount ?? 0}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DottedDivider(
                          dotRadius: 10,
                          color: HexColor("#BCBCBC"),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Unmatched',
                              style: TextStyle(
                                  color: HexColor("#BCBCBC"),
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            BidingHistoryTag(
                              tag:
                                  'QTY: ${_getQuantity(_biddingHistoryItem.unapprovedBidInfo?.amount, _biddingHistoryItem.unapprovedBidInfo?.ratePerQty).toInt()}',
                              color: Colors.red,
                            ),
                            const Spacer(),
                            Text(
                              '$RUPEE${_biddingHistoryItem.unapprovedBidInfo?.amount ?? 0}',
                              style: TextStyle(
                                  color: HexColor("#BCBCBC"),
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 15,
          ),
          const Divider()
        ],
      ),
    );
  }
}
