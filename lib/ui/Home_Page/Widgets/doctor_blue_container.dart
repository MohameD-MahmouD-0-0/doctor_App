import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorBlurContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Blue_Background.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Book and\n schedule with\n nearest doctor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Find Nearby',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.mainblue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            child: Image.asset('assets/images/doctor.png'),
          ),
        ],
      ),
    );
  }
}
