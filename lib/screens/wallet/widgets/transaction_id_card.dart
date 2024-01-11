import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/utility/constants.dart';

class TransactionIdCard extends StatelessWidget {
  final String date;
  final String transactionId;
  final VoidCallback? onPressed;

  const TransactionIdCard({
    Key? key,
    required this.date,
    required this.transactionId,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Color(0xFFF4F4F4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: Theme.of(context).textTheme.bodySmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(TRANSACTION_ID,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 4),
              Text(
                transactionId,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF181201),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset("assets/icons/copy.svg")
            ],
          ),
        ],
      ),
    );
  }
}
