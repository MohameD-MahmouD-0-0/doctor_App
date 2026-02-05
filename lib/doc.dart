import 'package:doctor/main.dart';
import 'package:doctor/ui/Home_Page/Book_Appointment/Third_Check/home_book_Appointment.dart';
import 'package:doctor/ui/Home_Page/Doctor_Profil/doctor_profile_page.dart';
import 'package:doctor/ui/Home_Page/Notification/notification_page.dart';
import 'package:doctor/ui/Home_Page/Search/doctor_search.dart';
import 'package:doctor/ui/Home_Page/Widgets/doctor_speciality_page.dart';
import 'package:doctor/ui/Home_Page/root_screen.dart';
import 'package:doctor/ui/Login/LoginScreen.dart';
import 'package:doctor/ui/Profile/faq_page.dart';
import 'package:doctor/ui/Profile/notification_page_setting.dart';
import 'package:doctor/ui/Profile/notification_setting.dart';
import 'package:doctor/ui/Profile/security_setting.dart';
import 'package:doctor/ui/Profile/setting.dart';
import 'package:doctor/ui/Register/register.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:doctor/ui/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doc App',
        theme: ThemeData(primaryColor: AppColor.mainblue),
        initialRoute: isLoggedIn == false
            ? OnBrdingScreen.routeName
            : RootScreen.routeName,
        routes: {
          Loginscreen.routeName: (context) => Loginscreen(),
          OnBrdingScreen.routeName: (context) => OnBrdingScreen(),
          RootScreen.routeName: (context) => RootScreen(),
          NotificationPage.routeName: (context) => NotificationPage(),
          DoctorSpecialityPage.routeName: (context) => DoctorSpecialityPage(),
          DoctorSearchPage.routName: (context) => DoctorSearchPage(),
          DoctoProfile.routeName: (context) => DoctoProfile(),
          HomeBookAppointment.routeName: (context) => HomeBookAppointment(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          Setting.routeName: (context) => Setting(),
          NotificationPageSetting.routeName: (context) => NotificationPageSetting(),
          SsecuritySetting.routeName: (context) => SsecuritySetting(),
          FaqPage.routeName: (context) => FaqPage(),
        },
      ),
    );
  }
}
