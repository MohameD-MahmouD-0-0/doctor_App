import 'package:doctor/logic/Home/Reposatiory/register_reposatiory_contract.dart';
import 'package:doctor/logic/cuibt/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterState> {
  final formKey = GlobalKey<FormState>();
  RegisterReposatioryContract registerReposatioryContract;

  RegisterViewModel(this.registerReposatioryContract)
    : super(RegisterInitialState());
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();

  void register() async{
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerReposatioryContract.register(
        name.text, email.text, phone.text, gender.text, password.text, confirmPassword.text,
      );
      either.fold((l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(RegisterSuccessState());
      });
    }
  }
}
