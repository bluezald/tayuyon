import 'package:flutter/material.dart';
import 'package:tayuyon/app_theme.dart';
import 'package:tayuyon/screens/intro/intro_screen.dart';
import 'package:tayuyon/screens/login/login_screen.dart';
import 'package:tayuyon/screens/market/market_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTeme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(),
    );
  }
}
