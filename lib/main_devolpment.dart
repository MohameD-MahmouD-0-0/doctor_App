import 'package:doctor/ui/Home_Page/cuibt/provider.dart';
import 'package:doctor/ui/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/feature/api_constant.dart';
import 'doc.dart';

bool isLoggedIn = false;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await checkLogIn();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChoseDoctorMeet()),
      ],
      child: DocApp(),
    ),
  );

}

checkLogIn() async {
  String? userTok = await SharedPrefsService.getString(
    SharedPreferenceHelper.userToken,
  );
  if (userTok == null || userTok.isEmpty) {
    isLoggedIn = false;
  } else {
    isLoggedIn = true;
  }
}