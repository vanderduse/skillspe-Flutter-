import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/sharedWidgets/clickable_card.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';

class TransactionHistoryCard extends StatelessWidget {
  final VoidCallback? onPress;

  const TransactionHistoryCard({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickableCard(
      onPressed: onPress,
      backgroundColor: Colors.white,
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset('assets/icons/debited.svg'),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Text(
                    'Bid Placed',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const VerticalSeparator(
                    heightFactor: 0.004,
                  ),
                  Text(
                    '02 Oct 2023',
                    style: TextStyle(
                      color: Color(0xFF5C6068),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            '₹ 120',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
