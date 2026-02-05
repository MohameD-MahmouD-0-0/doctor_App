import 'package:doctor/ui/Profile/custome_setting_row.dart';
import 'package:doctor/ui/Profile/notification_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';

class SsecuritySetting extends StatelessWidget {
  static const String routeName = 'security';

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
          'Security',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            NotificationSetting(text: 'Remember password', isOn: true),
            NotificationSetting(text: ' Face ID', isOn: false),
            NotificationSetting(text: 'PIN', isOn: true),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Google Authenticator',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Icon(Icons.arrow_right_sharp)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 2,
              color: Colors.grey.withAlpha(50),
            ),
          ],
        ),
      ),
    );
  }
}
