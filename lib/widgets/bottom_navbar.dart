import 'package:flutter/material.dart';
import 'package:stepping_stones/app_styles.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navBarIcons = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 0
              ? Image.asset('assets/icons/homeSelected.png', width: 24)
              : Image.asset('assets/icons/homeUnselected.png', width: 24),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 1
              ? Image.asset('assets/icons/calendarSelected.png', width: 24)
              : Image.asset('assets/icons/calendarUnselected.png', width: 24),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 2
              ? Image.asset('assets/icons/notificationsSelected.png', width: 24)
              : Image.asset('assets/icons/notificationUnselected.png', width: 24),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 3
              ? Image.asset('assets/icons/userSelected.png', width: 24)
              : Image.asset('assets/icons/userUnselected.png', width: 24),
        ),
        label: '',
      ),
    ];

    return Stack(
      children: [
        SizedBox(
          height: 75,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0, // Adjust the elevation here
            backgroundColor: AppStyles.colorScheme.primary,
            items: navBarIcons,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
