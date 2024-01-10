import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/sharedWidgets/wallet_icon.dart';

class AppbarWithBack extends StatelessWidget implements PreferredSizeWidget {
  final String screenName;
  final double walletAmount;
  final VoidCallback? onBackPress;

  AppbarWithBack({
    required this.screenName,
    required this.walletAmount,
    this.onBackPress,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      shape: const Border(
        bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.10), width: 1),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: onBackPress ?? () => Navigator.of(context).pop(),
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/icons/arrow-left.svg",
                height: 20,
                width: 20,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft, // Adjust the alignment as needed
            child: Text(
              screenName,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
      actions: [WalletIcon(walletAmount: walletAmount)],
    );
  }
}
