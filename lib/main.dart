//Nissa Nursabrina-2031710029-MI2E
import 'package:kasirfoodordering/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:kasirfoodordering/pages/LoginPage.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //implementasi build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
