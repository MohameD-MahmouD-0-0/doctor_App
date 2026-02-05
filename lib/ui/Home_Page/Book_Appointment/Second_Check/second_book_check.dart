import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../logic/cuibt/provider.dart';
import 'credit_card_list.dart';

class SecondBookChech extends StatefulWidget{
  int currentValue = 1;
  @override
  State<SecondBookChech> createState() => _SecondBookChechState();
}

class _SecondBookChechState extends State<SecondBookChech> {
  @override
  Widget build(BuildContext context) {
    ChoseDoctorMeet obj = context.read<ChoseDoctorMeet>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Option',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600
        ),),
        SizedBox(height: 20.h,),
        RadioListTile(
            activeColor: AppColor.mainblue,
            title: Text('Credit Card',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
            contentPadding: EdgeInsetsGeometry.only(left: 0),
            value: 1, groupValue:  widget.currentValue, onChanged: (value){
              setState(() {
                widget.currentValue = value!;
                obj.selectPayWay('Credit Card');

              });
        }),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CreditCard(),
        ),
        RadioListTile(
            activeColor: AppColor.mainblue,
            title: Text('Bank Transfer',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
            contentPadding: EdgeInsetsGeometry.only(left: 0),
            value: 2, groupValue:  widget.currentValue, onChanged: (value){
              setState(() {
                widget.currentValue = value!;
                obj.selectPayWay('Bank Transfer');

              });
        }),
        RadioListTile(
            activeColor: AppColor.mainblue,
            title: Text('Paypal',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
            contentPadding: EdgeInsetsGeometry.only(left: 0),
            value: 3, groupValue: widget.currentValue, onChanged: (value){
              setState(() {
                obj.selectPayWay('Paypal');
                widget.currentValue = value!;
              });
        })
      ],
    );
  }}