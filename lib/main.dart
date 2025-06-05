import 'package:cats_tinder/di/di.dart';
import 'package:cats_tinder/presentation/screens/cat_screen.dart';
import 'package:cats_tinder/presentation/widgets/splash_loader.dart';
import 'package:flutter/material.dart';

class MainSwitcher extends StatefulWidget {
  const MainSwitcher({super.key});

  @override
  State<MainSwitcher> createState() => _MainSwitcherState();
}

class _MainSwitcherState extends State<MainSwitcher> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _ready = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const SplashLoader();
    } else {
      return const CatScreen();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFFF8BBD0),
        ),
      ),
      home: const MainSwitcher(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDI();

  runApp(const MyApp());
}

