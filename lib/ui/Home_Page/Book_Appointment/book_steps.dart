import 'package:flutter/material.dart';

class BookSteps extends StatelessWidget {
  int index = 0;
  String statement;
  Color color;

  BookSteps({
    required this.index,
    required this.statement,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        Text(
          statement,style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        )
      ],
    );
  }
}
