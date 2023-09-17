import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.dart';
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/data_sources/remote/listings/listings_remote_data_source.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/data_sources/remote/listings/listings_remote_data_source_impl.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/repositories/listings_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/repositories/listings_repository.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/get_listings/get_listings_cubit.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/get_token/get_token_cubit.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void init() {
  injector

    // * DATA SOURCE
    ..registerLazySingleton<ListingsRemoteDataSource>(() {
      return ListingsRemoteDataSourceImpl(injector());
    })

    //* REPOSITORY
    ..registerLazySingleton<ListingsRepository>(() {
      return ListingsRepositoryImpl(
        injector(),
      );
    })

    //* USECASES
    ..registerFactory(() => ListingsUsecase(injector()))

    //* BLoC & CUBIT
    ..registerFactory(() => GetListingsCubit(injector()))
    ..registerFactory(() => GetTokenCubit(injector()))

    //* NETWORK
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => DioClient(injector()))

    //* ROUTER
    ..registerLazySingleton(AppRouter.new)

    //* THEME
    ..registerLazySingleton(AppTheme.new);
}
