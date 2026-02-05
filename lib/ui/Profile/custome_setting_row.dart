import 'package:flutter/material.dart';

class CustomSettingRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;

  CustomSettingRow({
    required this.imagePath,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomChoice(imagePath, text, color);
  }

  Widget CustomChoice(String imagePath, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(imagePath, width: 25, height: 25, fit: BoxFit.cover),
              SizedBox(width: 10),
              Text(text, style: TextStyle(fontSize: 16, color: color)),
              Spacer(),
              Icon(Icons.arrow_right_sharp),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.grey.withAlpha(50),
          ),
        ],
      ),
    );
  }
}
