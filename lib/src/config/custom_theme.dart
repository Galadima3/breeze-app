// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final customTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  fontFamily: GoogleFonts.urbanist().fontFamily,
  useMaterial3: true,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontFamily: GoogleFonts.urbanist().fontFamily,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontFamily: GoogleFonts.urbanist().fontFamily,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontFamily: GoogleFonts.urbanist().fontFamily,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
