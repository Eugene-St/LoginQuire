abstract class LoginEvent {}

class ForgotPasswordEvent extends LoginEvent {
  final String email;

  ForgotPasswordEvent({required this.email});
}

class OnLoginEvent extends LoginEvent {
  final String email;
  final String password;

  OnLoginEvent({required this.email, required this.password});
}
