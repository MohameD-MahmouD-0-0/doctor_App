import 'package:doctor/ui/Home_Page/tap_home_page.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'doctor_blue_container.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:
      Container(
        margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
        width: double.infinity,
        child:Column(
          children: [
            TapHomePage(),
            DoctorBlurContainer(),
          ],
        ) ,
      )
      ),
    );
  }

}