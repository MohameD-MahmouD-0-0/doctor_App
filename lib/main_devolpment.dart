import 'package:doctor/ui/shared_prefrence.dart';
import 'package:flutter/material.dart';

import 'data/feature/api_constant.dart';
import 'doc.dart';

bool isLoggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkLogIn();
  runApp(DocApp());
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
