import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:client/pages/beforePage.dart';
import 'package:client/pages/signinPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PET CARE',
      home: AnimatedSplashScreen(
        nextScreen: BeforePage(),
        splash: Image.asset(
          'assets/images/logo-petcare.png',
          width: 500,
          height: 500,
        ),
        splashTransition: SplashTransition.fadeTransition,
      ),
      routes: {
        '/signin': (context) => SignInPage(),
      },
    );
  }
}
