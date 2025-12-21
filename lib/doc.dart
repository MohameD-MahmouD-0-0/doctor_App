import 'package:doctor/main_devolpment.dart';
import 'package:doctor/ui/Home_Page/Book_Appointment/home_book_Appointment.dart';
import 'package:doctor/ui/Home_Page/Doctor_Profil/doctor_profile_page.dart';
import 'package:doctor/ui/Home_Page/Notification/notification_page.dart';
import 'package:doctor/ui/Home_Page/Search/doctor_search.dart';
import 'package:doctor/ui/Home_Page/Widgets/doctor_speciality_page.dart';
import 'package:doctor/ui/Home_Page/home_screen.dart';
import 'package:doctor/ui/Login/LoginScreen.dart';
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
        initialRoute: isLoggedIn == true
            ? OnBrdingScreen.routeName
            : HomeScreen.routeName,
        routes: {
          Loginscreen.routeName: (context) => Loginscreen(),
          OnBrdingScreen.routeName: (context) => OnBrdingScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          NotificationPage.routeName: (context) => NotificationPage(),
          DoctorSpecialPage.routeName: (context) => DoctorSpecialPage(),
          DoctorSearchPage.routName:(context)=>DoctorSearchPage(),
          DoctoProfile.routeName:(context)=>DoctoProfile(),
          HomeBookAppointment.routeName:(context)=>HomeBookAppointment(),
        },
      ),
    );
  }
}