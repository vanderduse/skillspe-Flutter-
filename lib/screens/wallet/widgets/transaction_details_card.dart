import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/wallet/widgets/transaction_id_card.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';
import 'package:skills_pe/utility/constants.dart';

class TransactionDetailsCard extends StatelessWidget {
  const TransactionDetailsCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align items to the start
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to the start
              children: [
                SvgPicture.asset('assets/icons/debited.svg'),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '₹ 120',
                  style: TextStyle(
                    color: Color(0xFF181201),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                VerticalSeparator(),
                Text('Bid Placed for challenge <Challenge name>',
                    style: Theme.of(context).textTheme.bodyMedium),
                VerticalSeparator(heightFactor: .03),
                TransactionIdCard(
                  transactionId: '#GFSGS123456',
                  date: 'January 7, 2024',
                ),
                VerticalSeparator(),
                Container(
                  width: double.infinity,
                  child: TextButton(onPressed: () {}, child: Text(NEED_HELP)),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black.withOpacity(0.10000000149011612)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: FilledBtn(
              label: SHARE,
              onPressed: () {},
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
