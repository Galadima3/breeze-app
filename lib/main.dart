// ignore_for_file: deprecated_member_use
import 'package:breeze/src/features/weather/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: GoogleFonts.urbanist().fontFamily,
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ), // Adjust as needed for different text styles
            bodyText2: TextStyle(
                color:
                    Colors.white), // Adjust as needed for different text styles
            headline1: TextStyle(color: Colors.white),
          )),
      home: const HomeScreen(),
    );
  }
}
