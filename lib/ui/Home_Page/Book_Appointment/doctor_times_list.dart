import 'package:doctor/ui/Home_Page/Book_Appointment/time_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_color.dart';
import '../cuibt/provider.dart';

class  DoctorTimeList extends StatefulWidget {

  @override
  State<DoctorTimeList> createState() => _DoctorTimeListState();
}

class _DoctorTimeListState extends State<DoctorTimeList> {
  int timeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 25,
          mainAxisExtent: 60,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
           double timeincreasing = 8 + (index * 0.5);
          return InkWell(
            onTap: () {
              setState(() {
                timeIndex = index;
                int hours = timeincreasing.floor();
                int minuts = index%2==0?0:30;
                Provider.of<ChoseDoctorMeet>(context, listen: false).saveTime(hours,minuts);
              });
            },
            child: TimeItem(
              time: index % 2 == 0
                  ? '${timeincreasing.floor()}:00'
                  : '${timeincreasing.floor()}:30',
              timeContainerColor: timeIndex == index
                  ? AppColor.mainblue
                  : Colors.grey.withAlpha(30),
              timeTextColor: timeIndex == index
                  ? Colors.white
                  : AppColor.grey.withAlpha(100),
            ),
          );
        },
      ),
    );
  }
}