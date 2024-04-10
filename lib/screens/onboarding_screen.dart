import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepping_stones/screens/home_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(() => HomePage());
    });
    return Scaffold(
      backgroundColor: Color(0xFF3DCCC7),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Image.asset('assets/images/onboardingImg.png'),
            ),
          ],
        ),
      ),
    );
  }
}
