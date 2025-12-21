import 'package:flutter/material.dart';

import '../../app_color.dart';

class SelectDataRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select Date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            'Set Manual',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.mainblue,
            ),
          ),
        ]);
  }

}