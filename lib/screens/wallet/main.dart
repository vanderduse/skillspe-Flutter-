import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/widgets/create_team_bottom_sheet.dart';
import 'package:skills_pe/screens/wallet/widgets/add_money_input_card.dart';
import 'package:skills_pe/screens/wallet/widgets/kyc_pending_card.dart';
import 'package:skills_pe/screens/wallet/widgets/transaction_details_card.dart';
import 'package:skills_pe/screens/wallet/widgets/transaction_history_card.dart';
import 'package:skills_pe/screens/wallet/widgets/transaction_history_header.dart';
import 'package:skills_pe/screens/wallet/widgets/wallet_balance_card.dart';
import 'package:skills_pe/sharedWidgets/appBars/noti_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: navigationWithWallet("Wallet", 20.3),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          children: [
            CompleteKycCard(),
            VerticalSeparator(),
            WalletBalance(),
            VerticalSeparator(),
            AddMoneyInputCard(),
            const VerticalSeparator(),
            const Divider(
              color: Color(0xffD0D1DA),
            ),
            const TransactionHistoryHeader(),
            const VerticalSeparator(),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              separatorBuilder: (context, index) =>
                  VerticalSeparator(heightFactor: 0.016),
              itemBuilder: (context, index) {
                return TransactionHistoryCard(
                  onPress: () {
                    // Handle onTap for each card
                    BottomSheetManager.showGenericBottomSheet(context,
                        TransactionDetailsCard(), "Transaction Details");
                  },
                );
              },
            )

            // ListView.builder(itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }
}
