// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/core/dio/dio_module.dart' as _i238;
import 'package:movie_app/data/local/local_module.dart' as _i434;
import 'package:movie_app/data/local/token_storage.dart' as _i880;
import 'package:movie_app/data/remote/movie_api.dart' as _i173;
import 'package:movie_app/data/repositories/movie_repository_impl.dart'
    as _i874;
import 'package:movie_app/data/repositories/token_repository_impl.dart'
    as _i958;
import 'package:movie_app/domain/repositories/movie_repository.dart' as _i294;
import 'package:movie_app/domain/repositories/token_repository.dart' as _i453;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    final dioModule = _$DioModule();
    gh.singletonAsync<_i558.FlutterSecureStorage>(
        () => localModule.createSecureStorage());
    gh.singleton<_i361.Dio>(
      () => dioModule.getUnauthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.factoryAsync<_i880.TokenStorage>(() async =>
        _i880.TokenStorage(await getAsync<_i558.FlutterSecureStorage>()));
    gh.singletonAsync<_i453.TokenRepository>(() async =>
        _i958.TokenRepositoryImpl(await getAsync<_i880.TokenStorage>()));
    gh.singletonAsync<_i361.Dio>(() async => dioModule
        .getAuthorizedDioClient(await getAsync<_i453.TokenRepository>()));
    gh.singletonAsync<_i173.MovieApi>(
        () async => _i173.MovieApi(await getAsync<_i361.Dio>()));
    gh.singletonAsync<_i294.MovieRepository>(() async =>
        _i874.MovieRepositoryImpl(await getAsync<_i173.MovieApi>()));
    return this;
  }
}

class _$LocalModule extends _i434.LocalModule {}

class _$DioModule extends _i238.DioModule {}
