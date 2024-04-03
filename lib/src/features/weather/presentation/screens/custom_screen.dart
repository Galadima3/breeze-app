import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final Widget inputWidget;
  const CustomScreen({super.key, required this.inputWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: inputWidget,
      ),
    );
  }
}
