import 'package:flutter/material.dart';
import '../../app_color.dart';

class SelectDoctorMeet extends StatefulWidget{
  int currentValue ;
  String title ;
  String image ;
  int valueIndex ;
  final Function(int) onChange;

  SelectDoctorMeet({required this.currentValue, required this.title,required this.image,
    required this.valueIndex,required this.onChange});
  @override
   State<SelectDoctorMeet> createState() => _SelectDoctorMeetState();
}

class _SelectDoctorMeetState extends State<SelectDoctorMeet> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        contentPadding: EdgeInsetsGeometry.only(left: 0),
        controlAffinity: ListTileControlAffinity.trailing,
        activeColor: AppColor.mainblue,
        value: widget.valueIndex,
        groupValue: widget.currentValue,
        onChanged: (value) {
         widget.onChange(value!);
        },
        title: Row(
          spacing: 20,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.mainblue.withAlpha(25),
              ),
              child: Image.asset(widget.image),
            ),
            Text(widget.title),
          ],
        ));
  }
}