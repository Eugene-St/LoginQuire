// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:quireloginform/data/api/services/auth_service.dart' as _i5;
import 'package:quireloginform/data/repositories/auth_repository_impl.dart'
    as _i7;
import 'package:quireloginform/domain/domain.dart' as _i9;
import 'package:quireloginform/domain/repositories/auth_repository.dart' as _i6;
import 'package:quireloginform/domain/usecases/login_usecase.dart' as _i8;
import 'package:quireloginform/networking/networking_module.dart' as _i11;
import 'package:quireloginform/presentation/pages/login/bloc/login_bloc.dart'
    as _i10;
import 'package:quireloginform/presentation/routes/app_router.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkingModule = _$NetworkingModule();
    gh.factory<_i3.Dio>(() => networkingModule.apiClient);
    gh.singleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.AuthService>(() => _i5.AuthService(gh<_i3.Dio>()));
    gh.factory<_i6.AuthRepository>(
        () => _i7.AuthRepositoryImpl(service: gh<_i5.AuthService>()));
    gh.factory<_i8.LoginUsecase>(
        () => _i8.LoginUsecase(authRepository: gh<_i9.AuthRepository>()));
    gh.factory<_i10.LoginBloc>(() => _i10.LoginBloc(gh<_i8.LoginUsecase>()));
    return this;
  }
}

class _$NetworkingModule extends _i11.NetworkingModule {}
