import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_manager.dart';
import 'bloc/challenges_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ChallengeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff7E56DA),
          primaryColorDark: Color(0xff2E1452),
          primaryColorLight: Color.fromRGBO(201, 179, 239, 0.20),
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
