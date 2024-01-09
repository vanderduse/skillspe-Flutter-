import 'package:flutter/material.dart';
import 'package:skills_pe/utility/constants.dart';

class TransactionHistoryHeader extends StatelessWidget {
  const TransactionHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(RECENT_TRANSACTIONS),
        TextButton(onPressed: () {}, child: Text(ALL_TRANSACTIONS))
      ],
    );
  }
}
