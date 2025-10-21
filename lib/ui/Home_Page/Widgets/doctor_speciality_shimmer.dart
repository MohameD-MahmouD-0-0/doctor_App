import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerDoctorSpecialityList extends StatelessWidget {
  const ShimmerDoctorSpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: index == 0
                ? EdgeInsets.all(0)
                : EdgeInsets.only(left: 25.w),
            child: Column(
              children: [
                ClipOval(
                  child: Shimmer(
                    duration: const Duration(seconds: 2),
                    interval: const Duration(milliseconds: 300),
                    color: Colors.grey.shade700,
                    colorOpacity: 0.4,
                    child: Container(
                      width: 60.w,
                      height: 60.w,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Shimmer(
                  duration: const Duration(seconds: 2),
                  interval: const Duration(milliseconds: 300),
                  color: Colors.grey.shade700,
                  colorOpacity: 0.4,
                  child: Container(
                    width: 50.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}