import 'package:doctor/ui/Profile/notification_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';

class NotificationPageSetting extends StatelessWidget{
  static const String routeName = 'notification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.grey.withAlpha(50),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(13.r),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            NotificationSetting(text: 'Notification from DocNow', isOn: true,),
            NotificationSetting(text: ' Sound', isOn: true,),
            NotificationSetting(text: 'Vibrate', isOn: true,),
            NotificationSetting(text: 'App Updates', isOn: false,),
            NotificationSetting(text: 'Special Offers', isOn: true,),
          ],
        ),
      )
    );

  }

}