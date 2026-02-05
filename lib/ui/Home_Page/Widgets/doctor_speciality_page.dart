import 'package:flutter/material.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityPage extends StatelessWidget {
  static const String routeName = 'DoctorSpecialityPage';

  final List<Map<String, String>> specialities = [
    {"icon": "assets/images/Man Doctor Europe 1.png", "title": "General"},
    {"icon": "assets/images/Frame.png", "title": "ENT"},
    {"icon": "assets/images/Iamge.png", "title": "Pediatric"},
    {"icon": "assets/images/Kidneys 1.png", "title": "Urologist"},
    {"icon": "assets/images/dentist.png", "title": "Dentistry"},
    {"icon": "assets/images/am3aa.png", "title": "Intestine"},
    {"icon": "assets/images/his.png", "title": "Histologist"},
    {"icon": "assets/images/hepatology.png", "title": "Hepatology"},
    {"icon": "assets/images/cardo.png", "title": "Cardiologist"},
    {"icon": "assets/images/Brain 1.png", "title": "Neurologic"},
    {"icon": "assets/images/pul.png", "title": "Pulmonary"},
    {"icon": "assets/images/Group.png", "title": "Optometry"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.grey.withAlpha(50),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          'Doctor Speciality',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: GridView.builder(
          itemCount: specialities.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 25.h,
            crossAxisSpacing: 20.w,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final item = specialities[index];
            return Column(
              children: [
                Container(
                  width: 75.w,
                  height: 75.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.mainblue.withAlpha(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Image.asset(item["icon"]!, fit: BoxFit.contain),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  item["title"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
