import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quireloginform/domain/usecases/login_usecase.dart';
import 'package:quireloginform/presentation/pages/login/bloc/auth_state.dart';
import 'package:quireloginform/presentation/pages/login/bloc/base_auth_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends BaseBloc<LoginEvent, BaseState> {
  final LoginUsecase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<OnLoginEvent>(_onLoginEvent);
  }

  FutureOr<void> _onLoginEvent(
      OnLoginEvent event, Emitter<BaseState> emit) async {

    await handleAsyncOperation(
        emit,
        () => _loginUseCase(
            LoginParams(email: event.email, password: event.password)),
        (message) => LoginSuccess(message),
        (error) => LoginFailure(error),
        successMessage: 'You have logged in.');
  }
}
