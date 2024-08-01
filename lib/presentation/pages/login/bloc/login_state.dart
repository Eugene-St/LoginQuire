import 'package:quireloginform/presentation/pages/login/bloc/auth_state.dart';

class LoginInitial extends BaseState {}

class LoginSuccess extends BaseState {
  final String successMessage;
  LoginSuccess(this.successMessage);
}

class LoginFailure extends BaseState {
  final String error;
  LoginFailure(this.error);
}