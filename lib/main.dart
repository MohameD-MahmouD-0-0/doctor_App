import 'package:doctor/ui/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/feature/api_constant.dart';
import 'doc.dart';
import 'logic/cuibt/provider.dart';

bool isLoggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkLogIn();
  runApp(
    ChangeNotifierProvider(create: (_) => ChoseDoctorMeet(), child: DocApp()),
  );
}

Future<void> checkLogIn() async {
  String? userTok = await SharedPrefsService.getString(
    SharedPreferenceHelper.userToken,
  );
  if (userTok == null || userTok.isEmpty) {
    isLoggedIn = false;
  } else {
    isLoggedIn = true;
  }
}
