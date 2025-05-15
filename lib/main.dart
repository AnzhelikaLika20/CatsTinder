import 'package:cats_tinder/presentation/screens/cat_screen.dart';
import 'package:flutter/material.dart';
import 'di/di.dart';

void main() {
  setupDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CatScreen(),
    );
  }
}
