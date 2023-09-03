import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/core/theme/app_theme.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void init() {
  injector
    //* NETWORK
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => DioClient(injector()))

    //* THEME
    ..registerLazySingleton(AppTheme.new);
}
