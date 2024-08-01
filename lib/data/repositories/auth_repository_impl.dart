import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quireloginform/core/failure.dart';
import 'package:quireloginform/data/api/services/auth_service.dart';
import 'package:quireloginform/domain/repositories/auth_repository.dart';
import 'package:quireloginform/networking/dio_exception_handler_mixin.dart';
import 'package:retrofit/retrofit.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl with DioExceptionHandler implements AuthRepository {
  final AuthService _service;

  AuthRepositoryImpl({
    required AuthService service,
  }) : _service = service;

  @override
  Future<Either<Failure, HttpResponse>> login(
      String email, String password) async {
    final result = await handleRequest(
        () => _service.login(email: email, password: password));

    return result.map((HttpResponse response) {
      return response;
    });
  }
}
