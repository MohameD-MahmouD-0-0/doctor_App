import 'package:doctor/ui/Profile/custom_choice_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Home_Page/root_screen.dart';
import '../app_color.dart';
import 'appointment_and_records_row.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainblue,
      appBar: AppBar(
        backgroundColor: AppColor.mainblue,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(RootScreen.routeName),
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('setting');
              },
              child: Icon(
                Icons.settings,
                size: 25.h,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -60.w,
              left: 130.h,
              child: CircleAvatar(
                radius: 60,
                child: Image.asset('assets/images/face.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: 60.h),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                  child: Center(
                    child: Text(
                      'Mohamed Mahmoud',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    'Mohamed24557@gmail.com',
                    style: TextStyle(fontSize: 16, color: AppColor.grey),
                  ),
                ),
                SizedBox(height: 20.h),
                AppointMentAndRecordsRow(),
                SizedBox(height: 20.h),
                CustomChoiceWidget(
                  'assets/images/clipboard-text.png',
                  'Personal Information',
                  AppColor.mainblue.withAlpha(30),
                ),
                CustomChoiceWidget(
                  'assets/images/clipboard-text.png',
                  'My Test & Diagnostic',
                  Colors.green.withAlpha(30),
                ),
                CustomChoiceWidget(
                  'assets/images/w.png',
                  'Payment',
                  Colors.red.withAlpha(30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
