import 'package:client/constants.dart';
import 'package:client/widgets/button.dart';
import 'package:client/widgets/textsp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BeforePage extends StatefulWidget {
  const BeforePage({Key? key}) : super(key: key);

  @override
  State<BeforePage> createState() => _BeforePageState();
}

class _BeforePageState extends State<BeforePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_q3mlcaak.json',
              controller: _controller,
              onLoaded: (composition) {
                _controller.forward();
              },
              repeat: false,
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding / 0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do you want?",
                      style: GoogleFonts.poppins(
                          fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: kDefaultPadding),
                    EvButton("Login", kBackgroudColor),
                    SizedBox(height: kDefaultPadding),
                    EvButton("Register", kBackgroudColor),
                    SizedBox(height: kDefaultPadding),
                    CnTextSp(context,
                        text1: "Already have an account?", text2: "Sign in"),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
