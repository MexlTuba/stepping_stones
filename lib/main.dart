import 'package:flutter/material.dart';
import 'package:stepping_stones/screens/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: OnboardingScreen(),
          ),
        ),
      ),
    );
  }
}