import 'package:flutter/material.dart';
import 'package:stepping_stones/models/patients.dart';
import 'package:stepping_stones/screens/calendar_page.dart';
import 'package:stepping_stones/screens/home_screen.dart';
import 'package:stepping_stones/screens/notification_page.dart';
import 'package:stepping_stones/screens/user_drawer.dart';
import 'package:stepping_stones/widgets/bottom_navbar.dart';

import 'package:flutter/material.dart';
// ... Other imports ...

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Scaffold key

  void _onItemTapped(int index) {
    if (index == 3) {
      _scaffoldKey.currentState?.openEndDrawer(); // Open end drawer
    } else {
      setState(() {
        _selectedIndex = index; // Switch between pages
      });
    }
  }

  // Pages for the IndexedStack
  final List<Widget> _pages = [
    HomeScreen(patientList: patientList), // Placeholder for HomeScreen page
    CalendarPage(), // Placeholder for Calendar page
    NotificationsPage(), // Placeholder for Notifications page
    // Do not place SideMenu here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SideMenu(), // Your custom drawer here, now as an endDrawer
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}