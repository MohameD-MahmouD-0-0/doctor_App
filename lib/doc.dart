import 'package:doctor/main_devolpment.dart';
import 'package:doctor/ui/Home_Page/home_screen.dart';
import 'package:doctor/ui/Login/LoginScreen.dart';
import 'package:doctor/ui/Notification/notification_page.dart';
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
            : HomeScreen.routeName,
        routes: {
          Loginscreen.routeName: (context) => Loginscreen(),
          OnBrdingScreen.routeName: (context) => OnBrdingScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          NotificationPage.routeName: (context) => NotificationPage(),
        },
      ),
    );
  }
}