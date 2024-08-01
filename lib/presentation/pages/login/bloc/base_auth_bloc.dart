import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quireloginform/core/failure.dart';
import 'package:quireloginform/presentation/pages/login/bloc/auth_state.dart';

abstract class BaseBloc<Event, State extends BaseState> extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  Future<void> handleAsyncOperation<T>(
      Emitter<State> emit,
      Future<Either<Failure, T>> Function() operation,
      State Function(String message) onSuccess,
      State Function(String error) onFailure,
      {required String successMessage}) async {
    emit(LoadingState() as State);
    final result = await operation();
    result.fold(
      (error) => emit(onFailure(error.message.toString())),
      (value) => emit(onSuccess(successMessage)),
    );
  }
}