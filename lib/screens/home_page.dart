import 'package:flutter/material.dart';
import 'package:stepping_stones/models/patients.dart';
import 'package:stepping_stones/screens/calendar_page.dart';
import 'package:stepping_stones/screens/home_screen.dart';
import 'package:stepping_stones/screens/notification_page.dart';
import 'package:stepping_stones/screens/user_drawer.dart';
import 'package:stepping_stones/widgets/bottom_navbar.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 

  void _onItemTapped(int index) {
    if (index == 3) {
      _scaffoldKey.currentState?.openEndDrawer(); 
    } else {
      setState(() {
        _selectedIndex = index; 
      });
    }
  }

  final List<Widget> _pages = [
    HomeScreen(patientList: patientList),
    CalendarPage(), 
    NotificationsPage(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SideMenu(), 
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