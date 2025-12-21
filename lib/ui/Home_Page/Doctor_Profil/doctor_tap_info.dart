import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/home/specialization_response.dart';

class DoctorTapInfo extends StatelessWidget {
  Doctors doctors;
  DoctorTapInfo({required this.doctors});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            'assets/images/Young male doctor in telemedicine concept stock….jpeg',
            width: 80.w,
            height: 80.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctors.name!,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.h),
              Text(
                'Specializes in ''${doctors.specialization!.name!}',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: 4.w),
                  Text(
                    "4.8 ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "(4,279 reviews)",
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.message_outlined, color: Colors.blue),
      ],
    );
  }
}
