import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Login/LoginScreen.dart';
import '../app_color.dart';
import 'doc_logo_and_name.dart';
import 'doctor_image_and _text.dart';

class OnBrdingCreen extends StatelessWidget {
  static const String routeName = 'OnBording';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DocLogoAndName(),
                SizedBox(height: 40.h),
                DocImageAndText(),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyle(color: AppColor.grey, fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    SizedBox(
                      width: 300.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Loginscreen.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.mainblue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
