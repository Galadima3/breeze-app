// ignore_for_file: deprecated_member_use
import 'package:breeze/src/config/custom_theme.dart';
import 'package:breeze/src/features/weather/presentation/screens/home_screen.dart';
import 'package:breeze/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 867),
      minTextAdapt: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: customTheme,
          routerConfig: router,
        );
      },
    );
  }
}

//TODO:
//Work on search functionality
