import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItem extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final String review;
  final int stars;

  const ReviewItem({
    super.key,
    required this.image,
    required this.name,
    required this.time,
    required this.review,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: List.generate(
                    5, (index) => Icon(
                      Icons.star,
                      color: index < stars ? Colors.amber : Colors.grey[300],
                      size: 18.sp,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  review,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[800],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}