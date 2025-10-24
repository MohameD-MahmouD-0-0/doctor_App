import 'package:doctor/ui/Notification/notification_item.dart';
import 'package:doctor/ui/Notification/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_color.dart';

class TapHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Omar',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'How Are you Today?',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.grey,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20.sp,
          backgroundColor: AppColor.grey.withAlpha(40),
          child: InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(NotificationPage.routeName);
            },
              child: Image.asset('assets/images/Button.png')),
        ),
      ],
    );
  }
}
