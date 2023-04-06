import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const brightness = Brightness.light;

ThemeData androidTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.tillana(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5.0
          ..color = Colors.white,
      ),
      headlineMedium: GoogleFonts.tillana(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        foreground: Paint()..color = const Color.fromARGB(255, 61, 185, 207),
      ),
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 36, 36, 36),
  );
}
