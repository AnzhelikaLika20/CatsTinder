import 'package:flutter/material.dart';

class SplashLoader extends StatelessWidget {
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 150,
          child: LinearProgressIndicator(
            minHeight: 8,
            color: Color(0xFFF8BBD0),
            backgroundColor: Color(0xFFFEEEF5),
          ),
        ),
      ),
    );
  }
}
