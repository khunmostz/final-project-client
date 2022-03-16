import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

Widget EvButton(String text, Color color, Function onPressed) {
  return Container(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w800),
      ),
    ),
  );
}
