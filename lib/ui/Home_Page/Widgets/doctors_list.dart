import 'package:doctor/data/home/specialization_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsList extends StatelessWidget {
  // Doctors doctorsList ;
  List<Doctors> docList ;
  DoctorsList({required this.docList});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0) ,
                  child: Image.asset(
                    'assets/images/Young male doctor in telemedicine concept stock….jpeg',
                    fit: BoxFit.cover,
                    width: 110.w,
                    height: 120.h,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  children: [Text(docList[index].name!), Text(docList[index].email!), Text(docList[index].phone!)],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
