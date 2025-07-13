import 'package:doctor/ui/Login/authe_datasource_imp.dart';
import 'package:doctor/ui/Login/cuibt/Login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authe_reposatiory_contract.dart';

class LoginViewModel extends Cubit<LoginState> {
  AutheReposatioryContract autheReposatioryContract;
   LoginViewModel({required this.autheReposatioryContract}) : super(LoginInitialState());
  final formKey = GlobalKey<FormState>();
  bool isObsucred = true;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  void login(String Email,String Password) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var either = await autheReposatioryContract.login(Email, Password);
      either.fold((l){
        emit(LoginErrorState(errorMessage: l.errorMessage));
      }, (response){
        emit(LoginSuccessState(loginResponse: response));
      });
    }
  }
}