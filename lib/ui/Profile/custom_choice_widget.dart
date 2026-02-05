import 'package:flutter/material.dart';

class CustomChoiceWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;

  CustomChoiceWidget(this.imagePath, this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return CustomChoice(imagePath, text, color);
  }

  Widget CustomChoice(String imagePath, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: Image.asset(
              imagePath,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
            backgroundColor: color,
          ),
          SizedBox(width: 10),
          Text(text,style: TextStyle(
            fontSize: 15,
          ),),
        ],
      ),
    );
  }
}
