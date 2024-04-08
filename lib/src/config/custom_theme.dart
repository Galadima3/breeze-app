// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final customTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  fontFamily: GoogleFonts.urbanist().fontFamily,
  useMaterial3: true,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
    ),
    bodyText2: TextStyle(color: Colors.white),
    headline1: TextStyle(color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
