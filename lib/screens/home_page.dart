import 'package:flutter/material.dart';
import 'package:stepping_stones/screens/onboarding_screen.dart';
import 'package:stepping_stones/widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            OnboardingScreen(),
            // Replace with actual screens corresponding to the tabs
            Text('Calendar Screen'),
            Text('Notification Screen'),
            Text('Profile Screen'),
          ],
        ),
      ),
    );
  }
}
