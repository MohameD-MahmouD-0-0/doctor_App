import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';

import 'doctor_speciality_page.dart';

class DoctorSpeciality extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(DoctorSpecialityPage.routeName);
          },
          child: Text(
            'See all',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.mainblue,
            ),
          ),
        ),
      ],
    );
  }
}
