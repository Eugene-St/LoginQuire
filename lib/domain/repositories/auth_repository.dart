import 'package:fpdart/fpdart.dart';
import 'package:quireloginform/core/core.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> login(String email, String password);
}