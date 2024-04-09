import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:stepping_stones/screens/calendar_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default font family
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: CalendarPage(),
          ),
        ),
      ),
    );
  }
}
