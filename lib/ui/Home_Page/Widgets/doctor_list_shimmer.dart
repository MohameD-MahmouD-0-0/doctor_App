import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerDoctorsList extends StatelessWidget {
  final int itemCount;

  const ShimmerDoctorsList({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Shimmer(
                  duration: const Duration(seconds: 2),
                  interval: const Duration(milliseconds: 300),
                  color: Colors.grey.shade300,
                  colorOpacity: 0.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      width: 110.w,
                      height: 120.h,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        interval: const Duration(milliseconds: 300),
                        color: Colors.grey.shade300,
                        colorOpacity: 0.4,
                        child: Container(
                          width: 120.w,
                          height: 17.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
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
                          width: 150.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),

                      Shimmer(
                        duration: const Duration(seconds: 2),
                        interval: const Duration(milliseconds: 300),
                        color: Colors.grey.shade300,
                        colorOpacity: 0.4,
                        child: Container(
                          width: 100.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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