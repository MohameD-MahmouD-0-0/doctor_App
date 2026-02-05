import 'package:flutter/material.dart';
import '../../../../logic/cuibt/provider.dart';
import '../../../app_color.dart';
import 'package:provider/provider.dart';
import 'calender.dart';

class CalenderList extends StatefulWidget{
  @override
  State<CalenderList> createState() => _CalenderListState();
}

class _CalenderListState extends State<CalenderList> {
  int selectedDayIndex = 0;
  @override
  Widget build(BuildContext context) {

   return SizedBox(
       height: 80,
       child:  ListView.builder(
         scrollDirection: Axis.horizontal,
         itemCount: 7,
         itemBuilder: (context, index) {
           DateTime dayDate = DateTime.now().add(Duration(days: index));
           bool isSelected = selectedDayIndex == index;
           String dayName = [
             'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat',
           ][dayDate.weekday % 7];
           return GestureDetector(
             onTap: () {
               setState(() {
                 selectedDayIndex = index;

               });
               String chosenDay = '${dayDate.year}-${dayDate.month}-${dayDate.day}';
               context.read<ChoseDoctorMeet>().saveday(chosenDay);
               context.read<ChoseDoctorMeet>().saveTodayName(dayName);
             },
             child: Padding(
               padding: const EdgeInsets.symmetric(
                 horizontal: 8,
                 vertical: 5,
               ),
               child: Calender(
                 selectedDayTextColor: isSelected
                     ? Colors.white
                     : AppColor.grey.withAlpha(100),
                 dayString: dayName,
                 dayNum: dayDate.day < 10
                     ? '0${dayDate.day}'
                     : '${dayDate.day}',
                 selectedDayColor: isSelected
                     ? AppColor.mainblue
                     : AppColor.grey.withAlpha(30),
               ),
             ),
           );
         },
       )
   );
  }
}