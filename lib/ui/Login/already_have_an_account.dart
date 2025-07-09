import 'package:flutter/material.dart';

import '../app_color.dart';

class AlreadyHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: 'Sign Ub',
              style: TextStyle(
                color: AppColor.mainblue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
