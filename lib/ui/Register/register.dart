import 'package:doctor/logic/cuibt/register_state.dart';
import 'package:doctor/logic/cuibt/register_view_model.dart';
import 'package:doctor/ui/Login/LoginScreen.dart';
import 'package:doctor/ui/Login/app_regex.dart';
import 'package:doctor/ui/Login/custom_text_form_filed.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel viewModel =
  RegisterViewModel(injectRegisterReposatiortContract());

  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.mainblue,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Sign up now and start exploring all that our\napp has to offer. We are excited to welcome\nyou to our community!',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColor.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 24.h),

                Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      CustomTextFormFiled(
                        hintText: 'Name',
                        controller: viewModel.name,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),

                      CustomTextFormFiled(
                        hintText: 'Email',
                        controller: viewModel.email,
                        validate: (value) {
                          if (value.isEmpty ||
                              !AppRegex.isEmailValid(value)) {
                            return 'Please enter a valid email';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),

                      CustomTextFormFiled(
                        hintText: 'Phone',
                        controller: viewModel.phone,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid phone number';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),

                      CustomTextFormFiled(
                        hintText: 'Password',
                        controller: viewModel.password,
                        validate: (value) {
                          if (value.isEmpty ||
                              !AppRegex.hasSpecialCharacter(value) ||
                              !AppRegex.hasMinLength(value)) {
                            return 'Please enter a valid password';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),

                      CustomTextFormFiled(
                        hintText: 'Confirm Password',
                        controller: viewModel.confirmPassword,
                        validate: (value) {
                          if (value.isEmpty ||
                              viewModel.password.text != value) {
                            return 'Passwords do not match';
                          }
                        },
                      ),

                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              value: 0,
                              title: const Text('Male'),
                              groupValue: val,
                              contentPadding: EdgeInsets.zero,
                              onChanged: (value) {
                                setState(() {
                                  val = value!;
                                  viewModel.gender.text = '$val';
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: 1,
                              title: const Text('Female'),
                              groupValue: val,
                              contentPadding: EdgeInsets.zero,
                              onChanged: (value) {
                                setState(() {
                                  val = value!;
                                  viewModel.gender.text = '$val';
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),
                      BlocConsumer<RegisterViewModel, RegisterState>(
                        bloc: viewModel,
                        listener: (context, state) {
                          if (state is RegisterErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errorMessage)),
                            );
                          }
                          if (state is RegisterSuccessState) {
                            Navigator.pushNamed(
                                context, Loginscreen.routeName);
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.register();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.mainblue,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: state is RegisterLoadingState
                                  ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                                  : Text(
                                'Register',
                                style: TextStyle(fontSize: 18.sp,color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 28.h),

                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              'or sign in with',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.grey,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),

                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(50),
                            child: CircleAvatar(
                              radius: 26.r,
                              backgroundColor:
                              const Color(0xff1877F2),
                              child: Icon(
                                Icons.facebook,
                                color: Colors.white,
                                size: 28.r,
                              ),
                            ),
                          ),
                          SizedBox(width: 24.w),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(50),
                            child: CircleAvatar(
                              radius: 26.r,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.apple,
                                color: Colors.white,
                                size: 28.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
