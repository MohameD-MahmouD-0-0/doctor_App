import 'package:doctor/ui/Login/terms_and_conditins_text.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'already_have_an_account.dart';
import 'custom_text_form_filed.dart';

class Loginscreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isObsucred = true;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.mainblue,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.grey,
                  ),
                ),
                SizedBox(height: 20.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormFiled(
                        controller: EmailController,
                        hintText: 'Email',
                        SuffixIcon: Icon(Icons.email),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormFiled(
                        controller: PasswordController,
                        hintText: 'Password',
                        SuffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsucred = !isObsucred;
                            });
                          },
                          child: Icon(
                            isObsucred
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        isObsucre: isObsucred,
                      ),
                      SizedBox(height: 25.h),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.mainblue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Loginscreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainblue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 16.sp)),
                  ),
                ),
                SizedBox(height: 30.h),
                TermsAndConditinsText(),
                SizedBox(height: 50.h),
                AlreadyHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
