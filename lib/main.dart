import 'package:client/pages/beforePage.dart';
import 'package:client/pages/contentPage.dart';
import 'package:client/pages/forgetPassPage.dart';
import 'package:client/pages/otpPage.dart';
import 'package:client/pages/resetPassPage.dart';
import 'package:client/pages/signinPage.dart';
import 'package:client/pages/signupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'petcare',
      options: FirebaseOptions(
        apiKey: "AIzaSyCuBc8a7lhOpcM6wGD0-N_sSxpIQtwkB2M",
        appId: "1:84153745120:android:d12a7d7b60afb4f56a1a85",
        messagingSenderId: "84153745120",
        projectId: "petcare-5218b",
      ),
    );
  }
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
      home: SplashScreenView(
        navigateRoute: BeforePage(),
        duration: 3000,
        imageSize: 300,
        imageSrc: "assets/images/logo-petcare.png",
        backgroundColor: Colors.white,
      ),
      routes: {
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/forget': (context) => ForgetPassPage(),
        '/otp': (context) => OtpPage(),
        '/resetpass': (context) => ResetPassPage(),
        '/content': (context) => ContentPage(),
      },
    );
  }
}
