import 'package:doctor/ui/Home_Page/home_screen.dart';
import 'package:doctor/ui/Login/cuibt/Login_state.dart';
import 'package:doctor/ui/Login/cuibt/login_view_model.dart';
import 'package:doctor/ui/Login/email_and_password.dart';
import 'package:doctor/ui/Login/terms_and_conditins_text.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../di.dart';
import 'already_have_an_account.dart';

class Loginscreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
   LoginViewModel viewModel =LoginViewModel(autheReposatioryContract: injectAutheReposatiortContract());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BlocProvider(
              create: (context) => viewModel,
              child: BlocConsumer<LoginViewModel, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                  }
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
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
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            EmailAndPassword(),
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
                            viewModel.login();

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
                          child: state is LoginLoadingState
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text('Login', style: TextStyle(fontSize: 16.sp)),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      TermsAndConditinsText(),
                      SizedBox(height: 50.h),
                      AlreadyHaveAccount(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
