import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';

class CustomTextFormFiled extends StatelessWidget {
  String hintText;
  Widget? SuffixIcon;
  bool ?isObsucre;
  TextEditingController controller;

  CustomTextFormFiled({required this.hintText, this.SuffixIcon,this.isObsucre,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.moreLightGray,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.h),
          borderSide: BorderSide(color: AppColor.grey, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.h),
          borderSide: BorderSide(color: AppColor.mainblue, width: 1.3),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        suffix: SuffixIcon,
      ),
      obscureText: isObsucre?? false ,
    );
  }
}
