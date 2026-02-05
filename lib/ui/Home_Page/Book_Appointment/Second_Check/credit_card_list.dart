import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final List<Map<String, String>> creditTypes = [
    {'icon': 'assets/images/master.png', 'title': 'Master Card'},
    {'icon': 'assets/images/american.png', 'title': 'American Express'},
    {'icon': 'assets/images/capital.png', 'title': 'Capital One'},
    {'icon': 'assets/images/bar.png', 'title': 'Barclays'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: creditTypes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: InkWell(
            child: Row(
              children: [
                Image.asset(
                  creditTypes[index]['icon']!,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  creditTypes[index]['title']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
