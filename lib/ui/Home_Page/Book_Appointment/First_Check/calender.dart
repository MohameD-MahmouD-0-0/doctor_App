import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Calender extends StatelessWidget {
  String dayNum;
  String dayString;
  Color selectedDayColor ;
  Color selectedDayTextColor ;

  Calender({required this.dayNum ,required this.dayString , required this.selectedDayColor,
  required this.selectedDayTextColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 10.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:  selectedDayColor,
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dayString,style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: selectedDayTextColor
          ),),
          SizedBox(height: 2.h,),
          Text('${dayNum}',style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: selectedDayTextColor
          ),),
        ],
      )
    );
  }
}
