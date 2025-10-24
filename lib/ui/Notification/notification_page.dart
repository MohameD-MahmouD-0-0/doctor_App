import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'notification_item.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName = 'NotificationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColor.mainblue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  '2 NEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 30,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today', style: TextStyle(color: AppColor.grey)),
                  Text(
                    'Mark all as read',
                    style: TextStyle(color: AppColor.mainblue),
                  ),
                ],
              ),
            ),
            NotificationItem(
              icon: Image.asset('assets/images/calendar-tick.png'),
              Notification_Title: 'Appointment Success ',
              Notification_Body:
                  'Congratulations - your appointment is\nconfirmed! We'
                  '\'re looking forward to meeting\nwith you and helping you achieve your goals.',
              time: '1h',
              color: Colors.green,
            ),
            SizedBox(height: 10.h),
            NotificationItem(
              icon: Image.asset('assets/images/calendarr.png'),
              Notification_Title: 'Schedule Changed',
              Notification_Body:
                  'You have successfully changed your\nappointment with Dr. Randy Wigham. Don’t\nforget to active your reminder.',
              time: '5h',
              color: Colors.blue,
            ),
            SizedBox(height: 10.h),

            NotificationItem(
              icon: Image.asset('assets/images/video.png'),
              Notification_Title: 'Video Call Appointment',
              Notification_Body:
                  'Well send you a link to join the call at the\nbooking details, so all you need is a\ncomputer or mobile device with a camera\nand an internet connection.',
              time: '7h',
              color: Colors.green,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Yesterday',style: TextStyle(color: AppColor.grey),),
            ),
            SizedBox(height:  30.h),
            NotificationItem(
              icon: Image.asset('assets/images/calendar-remove.png'),
              Notification_Title: 'Appointment Cancelled',
              Notification_Body:
                  'You have successfully canceled your\nappointment  with Dr. Randy Wigham. 50% of\nthe funds will be returned to your account.',
              time: '1d',
              color: Colors.red,
            ),
            SizedBox(height: 10.h),

            NotificationItem(
              icon: Image.asset('assets/images/wallet-2.png'),
              Notification_Title: 'New Payment Added!',
              Notification_Body:
                  'Your payment has been successfully linked\nwith Docdoc.',
              time: '1d',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
