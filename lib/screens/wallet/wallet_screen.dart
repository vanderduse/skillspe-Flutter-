import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wallet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more button press
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            WalletCard(
              title: 'Cash Wallet',
              balance: '₹2000.34',
              gradientColors: [Color(0xFF8247DF), Color(0xFF472779)],
              onAddPressed: () {
                // Handle Add button press
              },
              onWithdrawPressed: () {
                // Handle Withdraw button press
              },
              onRefreshPressed: () {
                // Handle Refresh button press
              },
              showSeparator: true,
              padding: const EdgeInsets.all(35.0), // Padding for Cash Wallet Card
              balanceTextStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 35, // Set the desired font size
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              isPromotional: false,
              buttonColor: Color(0xFF8247DF), // Set button color
            ),
            SizedBox(height: 16),
            WalletCard(
              title: 'Promotional Wallet',
              balance: '₹219.45',
              gradientColors: [Color(0xFFFF34C1), Color(0xFF991F74)],
              onAddPressed: null,
              onWithdrawPressed: null,
              onRefreshPressed: () {
                // Handle Refresh button press
              },
              showSeparator: false,
              padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 13.0, bottom: 3.0), // Reduced padding for Promotional Wallet Card
              balanceTextStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 32, // Adjusted font size to match the smaller card size
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              isPromotional: true,
            ),
            SizedBox(height: 25),
            Expanded(
              child: RecentTransactions(),
            ),
          ],
        ),
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  final String title;
  final String balance;
  final List<Color> gradientColors;
  final VoidCallback? onAddPressed;
  final VoidCallback? onWithdrawPressed;
  final VoidCallback onRefreshPressed;
  final bool showSeparator;
  final EdgeInsets padding; // Add padding parameter
  final TextStyle balanceTextStyle; // Add balance text style parameter
  final bool isPromotional; // Add flag to identify Promotional Wallet
  final Color? buttonColor; // Add button color parameter

  WalletCard({
    required this.title,
    required this.balance,
    required this.gradientColors,
    this.onAddPressed,
    this.onWithdrawPressed,
    required this.onRefreshPressed,
    required this.showSeparator,
    required this.padding, // Initialize padding parameter
    required this.balanceTextStyle, // Initialize balance text style parameter
    this.isPromotional = false, // Default to false if not provided
    this.buttonColor, // Initialize button color parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: padding, // Use the padding parameter
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1),
            Row(
              children: [
                Container(
                  width: 35, // Set the desired width
                  height: 35, // Set the desired height
                child : SvgPicture.asset(isPromotional ? 'assets/icons/promotional_symbol.svg' : 'assets/icons/rupee.svg'),),
                SizedBox(width: 7),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 21.78 / 18,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
            // Add gap for promotional card
            SizedBox(height: 12),
            if (isPromotional)
              SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isPromotional ? 'Your promotional balance is' : 'Your cash balance is',
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      balance,
                      style: balanceTextStyle, // Use the balance text style parameter
                    ),
                  ],
                ),
                //new code for refresh button
                Container(
                  width: 39, // Set the desired width
                  height: 39, // Set the desired height
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color(0x8247DF),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 40, // Adjust the width of the button
                      height: 33, // Adjust the height of the button
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/refresh.svg',
                          color: Colors.white,
                          width: 15, // Smaller icon for Refresh
                          height: 15,
                        ),
                        onPressed: onRefreshPressed,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //-----new code for the refresh button
            if (showSeparator)
              Column(
                children: [
                  SizedBox(height: 9),
                  DottedLine(
                    lineLength: double.infinity, // Make the line span the width
                    lineThickness: 1.5,
                    dashColor: Colors.white.withOpacity(0.3),
                    dashLength: 6, // Length of each dash
                  ),
                ],
              ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (onAddPressed != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 28),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                            color: buttonColor ?? Colors.white.withOpacity(0.2),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/add.svg',
                              color: Colors.white,
                              width: 20, // Larger icon for Add
                              height: 20,
                            ),
                            onPressed: onAddPressed,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Add',
                          style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                if (onWithdrawPressed != null)
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          color: buttonColor ?? Colors.white.withOpacity(0.2),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/withdraw.svg',
                            color: Colors.white,
                            width: 22, // Larger icon for Withdraw
                            height: 22,
                          ),
                          onPressed: onWithdrawPressed,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Withdraw',
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class RecentTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                'Recent Transactions',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: ListView(
                                  children: [
                                    TransactionTile(
                                      title: 'Cash Wallet',
                                      subtitle: '2 May 2024 at 9:33 AM',
                                      amount: '₹2000',
                                      amountColor: Color(0xFF7E56DA), // Cash Wallet amount color
                                      iconColor: Colors.white,
                                      iconPath: 'assets/icons/cash_wallet_incoming.svg', // Incoming icon
                                      backgroundColor: Color(0xFF7E56DA), // Cash Wallet background color
                                    ),
                                    TransactionTile(
                                      title: 'Promotional Wallet',
                                      subtitle: '2 May 2024 at 9:33 AM',
                                      amount: '₹200',
                                      amountColor: Color(0xFFFF34C1), // Promotional Wallet amount color
                                      iconColor: Colors.pink,
                                      iconPath: 'assets/icons/cash_wallet_incoming.svg', // Incoming icon
                                      backgroundColor: Color(0xFFFF34C1), // Promotional Wallet background color
                                    ),
                                    TransactionTile(
                                      title: 'Cash Wallet',
                                      subtitle: '2 May 2024 at 9:33 AM',
                                      amount: '- ₹180',
                                      amountColor: Color(0xFF7E56DA), // Cash Wallet amount color
                                      iconColor: Colors.purple,
                                      iconPath: 'assets/icons/cashwallet_outgoing.svg', // Outgoing icon
                                      backgroundColor: Color(0xFF7E56DA), // Cash Wallet background color
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text('See All',
                      style: TextStyle(color:Color(0xFF7E56DA),fontFamily: 'Inter',fontWeight: FontWeight.w700,fontSize: 12,decoration: TextDecoration.underline, // Add underline
                        decorationColor: Color(0xFF7E56DA), )),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(

              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TransactionTile(
                    title: 'Cash Wallet',
                    subtitle: '2 May 2024 at 9:33 AM',
                    amount: '₹2000',
                    amountColor: Color(0xFF7E56DA), // Cash Wallet amount color
                    iconColor: Colors.white,
                    iconPath: 'assets/icons/cash_wallet_incoming.svg', // Incoming icon
                    backgroundColor: Color(0xFF7E56DA), // Cash Wallet background color
                  ),
                  Divider(),
                  TransactionTile(
                    title: 'Promotional Wallet',
                    subtitle: '2 May 2024 at 9:33 AM',
                    amount: '₹200',
                    amountColor: Color(0xFFFF34C1), // Promotional Wallet amount color
                    iconColor: Colors.white,
                    iconPath: 'assets/icons/cash_wallet_incoming.svg', // Incoming icon
                    backgroundColor: Color(0xFFFF34C1), // Promotional Wallet background color
                  ),
                  Divider(),
                  TransactionTile(
                    title: 'Cash Wallet',
                    subtitle: '2 May 2024 at 9:33 AM',
                    amount: '- ₹180',
                    amountColor: Color(0xFF7E56DA), // Cash Wallet amount color
                    iconColor: Colors.white,
                    iconPath: 'assets/icons/cashwallet_outgoing.svg', // Outgoing icon
                    backgroundColor: Color(0xFF7E56DA), // Cash Wallet background color
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final Color iconColor;
  final String iconPath; // Add path for SVG icon
  final Color backgroundColor; // Add background color parameter

  TransactionTile({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.iconColor,
    required this.iconPath, // Initialize iconPath
    required this.backgroundColor, // Initialize backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
      leading: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 24,
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn), // Use colorFilter
          width: 24, // Set the width of the SVG icon
          height: 24, // Set the height of the SVG icon
        ),
      ),

        title: Text(title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 10, // Set the font size to 10 pixels
            fontWeight: FontWeight.w300, // Set the font weight to 300
          ),
        ),
      trailing: Text(
        amount,
        style: TextStyle(
          color: amountColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter', // Set the font family to Inter
          fontSize: 20, // Set the desired font size
        ),
      ),
    );
  }
}




