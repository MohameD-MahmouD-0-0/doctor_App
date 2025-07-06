import 'package:doctor/ui/LoginScreen.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:doctor/ui/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DocApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doc App',
        theme: ThemeData(
          primaryColor: AppColor.mainblue
        ),
        initialRoute:OnBrdingCreen.routeName ,
        routes: {
          Loginscreen.routeName:(context)=> Loginscreen(),
          OnBrdingCreen.routeName:(context)=> OnBrdingCreen()
        },
      ),
    );
  }
}