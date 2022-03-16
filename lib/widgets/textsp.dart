import 'package:client/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CnTextSp(BuildContext context,
    {required String text1, required String text2}) {
  return Align(
    alignment: Alignment.center,
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
        text: text1,
        style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0),
      ),
      TextSpan(
        text: text2,
        style: GoogleFonts.poppins(
            color: kBackgroudColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.pushNamed(context, '/signin');
          },
      )
    ])),
  );
}
