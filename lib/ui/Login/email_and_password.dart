import 'package:doctor/ui/Login/cuibt/login_view_model.dart';
import 'package:doctor/ui/Login/password_validation.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_regex.dart';
import 'custom_text_form_filed.dart';

class EmailAndPassword extends StatefulWidget {
  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {

 late LoginViewModel viewModel ;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = BlocProvider.of<LoginViewModel>(context); // الحصول على ViewModel من Provider
    checkPasswordController(viewModel.PasswordController.text);
  }

  // late TextEditingController tempPassword ;
  bool hasLowerCased = false;
  bool hasUpperCased = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasMinLength = false;


  void checkPasswordController(String value) {

    hasLowerCased = AppRegex.hasLowerCase(
      viewModel.PasswordController.text,
    );
    hasUpperCased = AppRegex.hasUpperCase(
      viewModel.PasswordController.text,
    );
    hasNumber = AppRegex.hasNumber(viewModel.PasswordController.text);
    hasSpecialChar = AppRegex.hasSpecialCharacter(
      viewModel.PasswordController.text,
    );
    hasMinLength = AppRegex.hasMinLength(viewModel.PasswordController.text);
    setState(() {
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiled(
          controller: viewModel.EmailController,
          hintText: 'Email',
          SuffixIcon: Icon(Icons.email),
          validate: (value) {
            if (value.isEmpty|| !AppRegex.isEmailValid(value)) {
              return "Please enter a valid email";
            }
          },
        ),
        SizedBox(height: 20.h),
        CustomTextFormFiled(
          onChanged: checkPasswordController,
          controller: viewModel.PasswordController,
          hintText: 'Password',
          SuffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                viewModel.isObsucred =! viewModel.isObsucred;
              });
            },
            child: Icon(
              viewModel.isObsucred ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          isObsucre: viewModel.isObsucred,
          validate: (value) {
            if (value.isEmpty) {
              return "Please enter a valid Password";
            }
          },
        ),
        SizedBox(height:30 ,),
        PasswordValidation(
          hasLowerCased: hasLowerCased,
          hasMinLength: hasMinLength,
          hasNumber: hasNumber,
          hasSpecialChar: hasSpecialChar,
          hasUpperCased: hasUpperCased,
        ),
      ],
    );
  }

}
