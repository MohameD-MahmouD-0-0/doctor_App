import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  bool hasLowerCased;
  bool hasUpperCased;
  bool hasNumber;
  bool hasSpecialChar;
  bool hasMinLength;

  PasswordValidation(
      {required this.hasLowerCased, required this.hasUpperCased, required this.hasNumber,
        required this.hasSpecialChar, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      bulidValidateRow('At least 1 lowercase letter', hasLowerCased),
      bulidValidateRow('At least 1 ubercase letter', hasUpperCased),
      bulidValidateRow('At least 1 number letter', hasNumber),
      bulidValidateRow('At least 1 special char letter', hasSpecialChar),
      bulidValidateRow('At least 8 letters', hasMinLength),

    ]);
  }

  Widget bulidValidateRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.6, backgroundColor: AppColor.grey),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationThickness: 2,
            decorationColor: Colors.green,
            color: hasValidated ? Colors.grey : Colors.blue,
          ),
        ),
      ],
    );
  }
}
