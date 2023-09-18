import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.dart';
import 'package:flutter_clean_architecture/src/core/cache/secure_storage.dart';
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/data_sources/remote/listings/listings_remote_data_source.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/data_sources/remote/listings/listings_remote_data_source_impl.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/repositories/listings_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/repositories/listings_repository.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/get_listings/get_listings_cubit.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/get_token/get_token_cubit.dart';
import 'package:flutter_clean_architecture/src/features/vcs/data/data_sources/vcs/vcs_remote_date_source.dart';
import 'package:flutter_clean_architecture/src/features/vcs/data/data_sources/vcs/vcs_remote_date_source_impl.dart';
import 'package:flutter_clean_architecture/src/features/vcs/data/repositories/vcs_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/repositories/vcs_repository.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/usecases/vcs_usecase.dart';
import 'package:flutter_clean_architecture/src/features/vcs/presentation/cubits/get_vc/get_vc_data_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void init() {
  injector

    // * DATA SOURCE
    ..registerLazySingleton<ListingsRemoteDataSource>(() {
      return ListingsRemoteDataSourceImpl(injector());
    })
    ..registerLazySingleton<VcsRemoteDataSource>(() {
      return VcsRemoteDataSourceImpl(injector());
    })

    //* REPOSITORY
    ..registerLazySingleton<ListingsRepository>(() {
      return ListingsRepositoryImpl(
        injector(),
      );
    })
    ..registerLazySingleton<VcsRepository>(() {
      return VcsRepositoryImpl(
        injector(),
      );
    })

    //* USECASES
    ..registerFactory(() => ListingsUsecase(injector()))
    ..registerFactory(() => VcsUsecase(injector()))

    //* BLoC & CUBIT
    ..registerFactory(() => GetListingsCubit(injector()))
    ..registerFactory(() => GetTokenCubit(injector()))
    ..registerFactory(() => GetVcDataCubit(injector()))

    //* NETWORK
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => DioClient(injector()))

    //* ROUTER
    ..registerLazySingleton(AppRouter.new)

    //* THEME
    ..registerLazySingleton(AppTheme.new)

    //* STORAGE
    ..registerLazySingleton(FlutterSecureStorage.new)
    ..registerLazySingleton(() => SecureStorage(injector()));
}
