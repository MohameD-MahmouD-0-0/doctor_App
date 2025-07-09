import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';

class TermsAndConditinsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyle(color: AppColor.grey, fontSize: 14.sp,fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyle(color: Colors.black, fontSize: 14.sp,fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: ' and',
            style: TextStyle(color:  AppColor.grey, fontSize: 14.sp,fontWeight: FontWeight.w500,height: 1.4.h),
          ),
          TextSpan(
            text: '   PrivacyPolicy',
            style: TextStyle(color: Colors.black, fontSize: 14.sp,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
