import 'package:flutter/material.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bidding_history_tag.dart';
import 'package:skills_pe/utility/constants.dart';

class BiddingHistoryItemView extends StatelessWidget {
  const BiddingHistoryItemView({super.key});

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
                backgroundColor: Theme.of(context).primaryColor,
                child: const Center(
                  child: Text(
                    "P",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [Text('Yes'), BidingHistoryTag()],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Avg: ${RUPEE}3.5 | Qty: 20')
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${RUPEE}200',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "+2,00.14",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider()
        ],
      ),
    );
  }
}
