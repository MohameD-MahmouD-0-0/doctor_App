import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/logic/cuibt/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOut extends Cubit<LogoutState> {
  LogOut({required this.apiManager}) : super(LogoutInitialState());
  ApiManager apiManager=ApiManager.getinstance();

  Future<void> logOut() async {
    emit(LogoutLoadingState());
    var either = await apiManager.logOut();
    return either.fold(
      (l) {
        emit(LogoutErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        emit(LogoutSuccessState());
      },
    );
  }
}
