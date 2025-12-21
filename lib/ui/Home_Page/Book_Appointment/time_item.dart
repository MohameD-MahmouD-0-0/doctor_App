import 'package:flutter/material.dart';

class TimeItem extends StatelessWidget {
  String time;
  Color timeContainerColor;
  Color timeTextColor;

  TimeItem({required this.time, required this.timeContainerColor,required this.timeTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: timeContainerColor,
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: timeTextColor,
          ),
        ),
      ),
    );
  }
}
