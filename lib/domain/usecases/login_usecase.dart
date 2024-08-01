import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:quireloginform/core/core.dart';
import 'package:quireloginform/domain/domain.dart';

@injectable
class LoginUsecase extends AsyncUseCase<LoginParams, void> {
  final AuthRepository _authRepository;

  LoginUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> execute(LoginParams param) {
    return _authRepository.login(param.email, param.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}