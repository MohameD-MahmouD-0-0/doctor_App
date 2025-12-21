import 'package:doctor/ui/Home_Page/Book_Appointment/select_data_row.dart';
import 'package:doctor/ui/Home_Page/Book_Appointment/select_doctor_meet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../cuibt/provider.dart';
import 'calender_list.dart';
import 'doctor_times_list.dart';

class FirstBookCheck extends StatefulWidget{
  int currentValue = 1;

  @override
  State<FirstBookCheck> createState() => _FirstBookCheckState();
}

class _FirstBookCheckState extends State<FirstBookCheck> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectDataRow(),
        SizedBox(height: 25.h),
        CalenderList(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Available time',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        DoctorTimeList(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Appointment Type',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SelectDoctorMeet(
          title: 'in Person',
          image: 'assets/images/inprofile.png',
          valueIndex: 1,
          currentValue: widget.currentValue,
          onChange: (value) {
            Provider.of<ChoseDoctorMeet>(context,listen: false).selectMeetWay('in Person');
            setState(() {
              widget.currentValue = value;
            });
          },
        ),
        SelectDoctorMeet(
          title: 'Video Call',
          image: 'assets/images/video.png',
          currentValue: widget.currentValue,
          valueIndex: 2,
          onChange: (value) {
            setState(() {
              widget.currentValue = value;
              Provider.of<ChoseDoctorMeet>(context,listen: false).selectMeetWay('Video Call');

            });
          },
        ),
        SelectDoctorMeet(
          title: 'Phone Call',
          image: 'assets/images/Vector.png',
          currentValue: widget.currentValue,
          valueIndex: 3,
          onChange: (value) {
            setState(() {
              widget.currentValue = value;
              Provider.of<ChoseDoctorMeet>(context,listen: false).selectMeetWay('Phone Call');

            });
          },
        ),
      ],);
  }
}