import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quireloginform/data/api/routes/auth_routes.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@injectable
@RestApi()
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @POST(AuthRoutes.login)
  Future<HttpResponse> login({
    @Field("email") required String email,
    @Field("password") required String password,
  });
}