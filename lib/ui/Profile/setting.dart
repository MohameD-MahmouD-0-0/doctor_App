import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/feature/api_manager.dart';
import '../../logic/cuibt/log_out_view_model.dart';
import '../../logic/cuibt/logout_state.dart';
import '../app_color.dart';
import 'custome_setting_row.dart';

class Setting extends StatefulWidget {
  static const String routeName = 'setting';

  final LogOut viewModel = LogOut(apiManager: ApiManager.getinstance());

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
                borderRadius: BorderRadius.circular(13.r),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
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
          'Setting',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('notification');
            },
            child: CustomSettingRow(
              imagePath: 'assets/images/notification.png',
              text: 'Notification',
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('faq');
            },
            child: CustomSettingRow(
              imagePath: 'assets/images/message-question.png',
              text: 'FAQ',
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('security');
            },
            child: CustomSettingRow(
              imagePath: 'assets/images/lock.png',
              text: 'Security',
              color: Colors.black,
            ),
          ),
          CustomSettingRow(
            imagePath: 'assets/images/language-square.png',
            text: 'Language',
            color: Colors.black,
          ),
          InkWell(
            onTap: () {
              logOutAlertDialoge(context);
            },
            child: CustomSettingRow(
              imagePath: 'assets/images/logout.png',
              text: 'Logout',
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }


  Future<void> logOutAlertDialoge(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocConsumer<LogOut, LogoutState>(
          bloc: widget.viewModel,
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              Navigator.of(dialogContext).pop(); // اقفل dialog
              Navigator.of(context).pushNamedAndRemoveUntil(
                'LoginScreen',
                    (route) => false,
              );
            }

            if (state is LogoutErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout failed')),
              );
            }
          },
          builder: (context, state) {
            return AlertDialog(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('You’ll need to enter your username.'),
                    Text(' and password next time'),
                    Text(' you want to login'),
                  ],
                ),
              ),
              actions: [
                state is LogoutLoadingState? Center(child: CircularProgressIndicator()):
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.mainblue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                    ),
                    Container(
                      width: 1,
                      height: 50.h,
                      color: AppColor.grey.withAlpha(20),
                    ),
                   TextButton(
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {
                        widget.viewModel.logOut();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
