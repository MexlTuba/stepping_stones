import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:stepping_stones/screens/home_page.dart';
import 'package:stepping_stones/screens/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: SafeArea(
          child: Scaffold(
            body: Center(
              child: OnboardingScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
