import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_color.dart';

class NotificationSetting extends StatefulWidget {
  String text;
  bool isOn = true;

  NotificationSetting({
    required this.text,
    required this.isOn,
  });

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  @override
  Widget build(BuildContext context) {
    return notificationRow(widget.text);
  }

  Widget notificationRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,

              ),),
              Switch(
                value: widget.isOn,
                onChanged: (value){
                  widget.isOn =!widget.isOn;
                  setState(() {
                  });
                },
                activeTrackColor: AppColor.mainblue,
                inactiveThumbColor: AppColor.grey,
              ),
            ],
          ),SizedBox(height: 6.h,),
          Container(color: AppColor.grey.withAlpha(20),height: 2,width: double.infinity,)
        ],
      ),
    );
  }
}
