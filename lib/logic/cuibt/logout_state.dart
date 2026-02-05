abstract class LogoutState{}
class LogoutInitialState extends LogoutState{}
class LogoutLoadingState extends LogoutState{}
class LogoutErrorState extends LogoutState{
  String errorMessage;
  LogoutErrorState({required this.errorMessage});
}
class LogoutSuccessState extends LogoutState{}
