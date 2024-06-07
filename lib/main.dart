import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_pe/firebase_options.dart';
import 'package:skills_pe/screens/home_screens/ui/main.dart';
import 'package:skills_pe/service/storage_service.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/screens/wallet/wallet_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance
      .getToken()
      .then((value) => StorageService().writeSecureData(FCM_TOKEN, value))
      .onError((error, stackTrace) => print(error));
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
      alert: true, announcement: true, badge: true, sound: true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        title: 'SkillsPe',
        theme: ThemeData(
          primaryColor: const Color(0xff7E56DA),
          primaryColorDark: const Color(0xff2E1452),
          primaryColorLight: const Color.fromRGBO(201, 179, 239, 0.20),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  color: Color(0xff0A121A)),
              bodyLarge: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  color: Color(0xff0A121A)),
              bodyMedium: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter"),
              labelSmall: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  color: Color(0xff5C6068)),
              labelMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
                color: Color(0xff5C6068),
              )),
          fontFamily: 'Inter',
          useMaterial3: true,
        ),
        home: const HomeMain());
  }
}
//--------------------------------------------------------------ram code
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wallet',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         fontFamily: 'Inter',
//         scaffoldBackgroundColor: Color(0xFFF4F4F4),
//       ),
//       home: WalletScreen(),
//     );
//   }
// }
//
// class WalletScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Wallet'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {
//               // Handle more button press
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             WalletCard(
//               title: 'Cash Wallet',
//               balance: '₹2000.34',
//               gradientColors: [Color(0xFF8247DF), Color(0xFF472779)],
//               onAddPressed: () {
//                 // Handle Add button press
//               },
//               onWithdrawPressed: () {
//                 // Handle Withdraw button press
//               },
//               onRefreshPressed: () {
//                 // Handle Refresh button press
//               },
//               showSeparator: true,
//             ),
//             SizedBox(height: 16),
//             WalletCard(
//               title: 'Promotional Wallet',
//               balance: '₹219.45',
//               gradientColors: [Color(0xFFFF34C1), Color(0xFF991F74)],
//               onAddPressed: null,
//               onWithdrawPressed: null,
//               onRefreshPressed: () {
//                 // Handle Refresh button press
//               },
//               showSeparator: false,
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: RecentTransactions(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class WalletCard extends StatelessWidget {
//   final String title;
//   final String balance;
//   final List<Color> gradientColors;
//   final VoidCallback? onAddPressed;
//   final VoidCallback? onWithdrawPressed;
//   final VoidCallback onRefreshPressed;
//   final bool showSeparator;
//
//   WalletCard({
//     required this.title,
//     required this.balance,
//     required this.gradientColors,
//     this.onAddPressed,
//     this.onWithdrawPressed,
//     required this.onRefreshPressed,
//     required this.showSeparator,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gradientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 SvgPicture.asset('assets/svgs/rupee.svg', color: Colors.white),
//                 SizedBox(width: 8),
//                 Text(
//                   title,
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Your cash balance is',
//                       style: TextStyle(color: Colors.white70, fontSize: 14),
//                     ),
//                     Text(
//                       balance,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     border: Border.all(color: Colors.white.withOpacity(0.2)),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: IconButton(
//                     icon: SvgPicture.asset('assets/svgs/refresh.svg',
//                         color: Colors.white),
//                     onPressed: onRefreshPressed,
//                   ),
//                 ),
//               ],
//             ),
//             if (showSeparator)
//               Column(
//                 children: [
//                   SizedBox(height: 16),
//                   Divider(
//                     color: Colors.white.withOpacity(0.4),
//                     thickness: 1,
//                   ),
//                 ],
//               ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 if (onAddPressed != null)
//                   Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                                 color: Colors.white.withOpacity(0.2)),
//                             color: Colors.white.withOpacity(0.2),
//                           ),
//                           child: IconButton(
//                             icon: SvgPicture.asset('assets/svgs/add.svg',
//                                 color: Colors.white),
//                             onPressed: onAddPressed,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'Add',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 if (onWithdrawPressed != null)
//                   Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border:
//                           Border.all(color: Colors.white.withOpacity(0.2)),
//                           color: Colors.white.withOpacity(0.2),
//                         ),
//                         child: IconButton(
//                           icon: SvgPicture.asset('assets/svgs/withdraw.svg',
//                               color: Colors.white),
//                           onPressed: onWithdrawPressed,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Withdraw',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class RecentTransactions extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Recent Transactions',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return Container(
//                       padding: EdgeInsets.all(16.0),
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           Text(
//                             'Recent Transactions',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           Expanded(
//                             child: ListView(
//                               children: [
//                                 TransactionTile(
//                                   title: 'Cash Wallet',
//                                   subtitle: '2 May 2024 at 9:33 AM',
//                                   amount: '₹2000',
//                                   amountColor: Colors.green,
//                                   iconColor: Colors.purple,
//                                 ),
//                                 TransactionTile(
//                                   title: 'Promotional Wallet',
//                                   subtitle: '2 May 2024 at 9:33 AM',
//                                   amount: '₹200',
//                                   amountColor: Colors.green,
//                                   iconColor: Colors.pink,
//                                 ),
//                                 TransactionTile(
//                                   title: 'Cash Wallet',
//                                   subtitle: '2 May 2024 at 9:33 AM',
//                                   amount: '- ₹180',
//                                   amountColor: Colors.red,
//                                   iconColor: Colors.purple,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: Text('See All'),
//             ),
//           ],
//         ),
//         SizedBox(height: 8),
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.grey.shade300),
//             color: Colors.white,
//           ),
//           child: Column(
//             children: [
//               TransactionTile(
//                 title: 'Cash Wallet',
//                 subtitle: '2 May 2024 at 9:33 AM',
//                 amount: '₹2000',
//                 amountColor: Colors.green,
//                 iconColor: Colors.purple,
//               ),
//               TransactionTile(
//                 title: 'Promotional Wallet',
//                 subtitle: '2 May 2024 at 9:33 AM',
//                 amount: '₹200',
//                 amountColor: Colors.green,
//                 iconColor: Colors.pink,
//               ),
//               TransactionTile(
//                 title: 'Cash Wallet',
//                 subtitle: '2 May 2024 at 9:33 AM',
//                 amount: '- ₹180',
//                 amountColor: Colors.red,
//                 iconColor: Colors.purple,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class TransactionTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String amount;
//   final Color amountColor;
//   final Color iconColor;
//
//   TransactionTile({
//     required this.title,
//     required this.subtitle,
//     required this.amount,
//     required this.amountColor,
//     required this.iconColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: iconColor,
//         child: Icon(Icons.arrow_forward, color: Colors.white),
//       ),
//       title: Text(title),
//       subtitle: Text(subtitle),
//       trailing: Text(amount, style: TextStyle(color: amountColor)),
//     );
//   }
// }

//----------------------end here ram

//
// import 'package:chucker_flutter/chucker_flutter.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:skills_pe/firebase_options.dart';
// import 'package:skills_pe/screens/home_screens/ui/main.dart';
// import 'package:skills_pe/service/storage_service.dart';
// import 'package:skills_pe/utility/constants.dart';
// import 'package:skills_pe/screens/wallet_screen.dart'; // Add this import
// import 'screens/wallet_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FirebaseMessaging.instance
//       .getToken()
//       .then((value) => StorageService().writeSecureData(FCM_TOKEN, value))
//       .onError((error, stackTrace) => print(error));
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   await messaging.requestPermission(
//       alert: true, announcement: true, badge: true, sound: true);
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       navigatorObservers: [ChuckerFlutter.navigatorObserver],
//       title: 'SkillsPe',
//       theme: ThemeData(
//         primaryColor: const Color(0xff7E56DA),
//         primaryColorDark: const Color(0xff2E1452),
//         primaryColorLight: const Color.fromRGBO(201, 179, 239, 0.20),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         textTheme: const TextTheme(
//             titleLarge: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "Inter",
//                 color: Color(0xff0A121A)),
//             bodyLarge: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: "Inter",
//                 color: Color(0xff0A121A)),
//             bodyMedium: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: "Inter"),
//             labelSmall: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: "Inter",
//                 color: Color(0xff5C6068)),
//             labelMedium: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               fontFamily: "Inter",
//               color: Color(0xff5C6068),
//             )),
//         fontFamily: 'Inter',
//         useMaterial3: true,
//       ),
//       home: const HomeMain(),
//     );
//   }
// }
