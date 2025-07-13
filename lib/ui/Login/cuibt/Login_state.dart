import 'package:doctor/data/authe/Login_response.dart';

abstract class LoginState{}
class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState{
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}
class LoginSuccessState extends LoginState{
   LoginResponse loginResponse;
  LoginSuccessState({required this.loginResponse});
}
