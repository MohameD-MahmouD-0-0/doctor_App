import 'package:doctor/ui/Home_Page/cuibt/provider.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Notification/notification_item.dart';

class ThirdBookCheck extends StatefulWidget {
  final String doctorName;
  final String email;
  final String phone;

  const ThirdBookCheck({
    super.key,
    required this.doctorName,
    required this.phone,
    required this.email,
  });

  @override
  State<ThirdBookCheck> createState() => ThirdBookCheckState();
}

class ThirdBookCheckState extends State<ThirdBookCheck> {
  @override
  Widget build(BuildContext context) {
    final String dateTimeText =
        '${ChoseDoctorMeet.dayName} ${ChoseDoctorMeet.selectedDay}\n'
        '${ChoseDoctorMeet.mintes == 0
        ? '${ChoseDoctorMeet.selectedTime}:00 AM'
        : '${ChoseDoctorMeet.selectedTime}:${ChoseDoctorMeet.mintes} AM'}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            'Booking information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: NotificationItem(
            color: AppColor.mainblue,
            icon: Image.asset('assets/images/calendarr.png'),
            Notification_Title: 'Date & Time',
            Notification_Body: dateTimeText,
            time: '',
          ),
        ),
        const Divider(height: 3, thickness: 1),
        SizedBox(height: 15.h),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: NotificationItem(
            color: AppColor.mainblue,
            icon: Image.asset('assets/images/clipboard-text.png'),
            Notification_Title: 'Appointment Type',
            Notification_Body: ChoseDoctorMeet.selectedMeet,
            time: '',
          ),
        ),
        Divider(height: 3.h, thickness: 1),
        SizedBox(height: 20.h),
        const Text(
          'Doctor information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/Young male doctor in telemedicine concept stock….jpeg',
                  fit: BoxFit.cover,
                  width: 110.w,
                  height: 120.h,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 80.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctorName,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.phone,
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        const Text(
          'Payment Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        NotificationItem(
          icon: Image.asset('assets/images/master.png'),
          Notification_Title: ChoseDoctorMeet.payment,
          Notification_Body: '***** ***** ***** 4242',
          time: "",
          color: Colors.transparent,
        ),
      ],
    );
  }
}
