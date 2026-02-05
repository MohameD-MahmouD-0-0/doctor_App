import 'package:doctor/ui/Home_Page/Book_Appointment/First_Check/time_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../logic/cuibt/provider.dart';
import '../../../app_color.dart';

class DoctorTimeList extends StatefulWidget {
  const DoctorTimeList({super.key});

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
          double timeIncreasing = 8 + (index * 0.5);
          return InkWell(
            onTap: () {
              setState(() {
                timeIndex = index;
                int hours = timeIncreasing.floor();
                int minutes = index % 2 == 0 ? 0 : 30;
                context.read<ChoseDoctorMeet>().saveTime(hours, minutes);
              });
            },
            child: TimeItem(
              time: index % 2 == 0
                  ? '${timeIncreasing.floor()}:00'
                  : '${timeIncreasing.floor()}:30',
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
