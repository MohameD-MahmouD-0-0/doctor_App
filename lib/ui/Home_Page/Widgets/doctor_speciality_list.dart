import 'package:doctor/data/home/specialization_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityList extends StatelessWidget {
  List<String> images = [
    'assets/images/Man Doctor Europe 1.png',
    'assets/images/Brain 1.png',
    'assets/images/Iamge.png',
    'assets/images/Kidneys 1.png',
    'assets/images/Man Doctor Europe 1.png',
    'assets/images/Brain 1.png',
    'assets/images/Iamge.png',
    'assets/images/Kidneys 1.png',
    'assets/images/Man Doctor Europe 1.png',
    'assets/images/Brain 1.png',

  ];
  SpecializationResponse specialization_response;

  DoctorSpecialityList({required this.specialization_response});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: index == 0 ? EdgeInsets.all(0) : EdgeInsets.only(left: 25),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey.withAlpha(20),
                  child: Image.asset(images[index]),
                ),
                Text(specialization_response.data![index].name!),
              ],
            ),
          );
        },
        itemCount: specialization_response.data?.length,
      ),
    );
  }
}
