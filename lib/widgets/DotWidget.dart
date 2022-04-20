//Nissa Nursabrina-2031710029-MI2E
import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final int activeIndex;
  final int dotIndex;

  DotWidget({this.activeIndex, this.dotIndex});

  @override
  Widget build(BuildContext context) {
    //implementasi build
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color:
                (dotIndex == activeIndex) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle),
      ),
    );
  }
}
