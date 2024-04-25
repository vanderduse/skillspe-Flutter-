import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_pe/firebase_options.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_manager.dart';
import 'package:skills_pe/service/storage_service.dart';
import 'package:skills_pe/utility/constants.dart';

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
        home: const SplashManager());
  }
}
