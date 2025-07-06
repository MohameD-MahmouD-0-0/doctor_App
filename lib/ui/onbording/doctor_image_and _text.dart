import 'package:flutter/material.dart';

import '../app_color.dart';

class DocImageAndText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/doc_doc_low_opacity.png',color: AppColor.mainblue.withValues(alpha: 0.1),),
        Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.white.withAlpha(0),
              ],begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.14,0.4])
            ),
            child: Image.asset('assets/images/doctor_pic.png')
        ),
        Positioned(
          bottom: 10,
          left: 50,
          child: Text('Best Doctor\n Appointment App',textAlign: TextAlign.center,style: TextStyle(
            height: 1.4,
            fontSize: 30,
            fontWeight: FontWeight.w700,color: AppColor.mainblue,
          ),),
        )
      ],
    );

  }
}
