import 'package:flutter/material.dart';

import '../app_color.dart';

class CustomFaqRow extends StatelessWidget {
  String title;
  String ?description;

  CustomFaqRow({required this.title,this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Text(
            description ?? '',
            style: TextStyle(fontSize: 13, color: AppColor.grey),
          ),
        ],
      ),
    );
  }
}
