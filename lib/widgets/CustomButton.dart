//Nissa Nursabrina-2031710029-MI2E
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final GestureTapCallback onTap;

  CustomButton({this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    //implementasi build
    return ElevatedButton(
      onPressed: onTap,
      child: Text(name),
    );
  }
}
