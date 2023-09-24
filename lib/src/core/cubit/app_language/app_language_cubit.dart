import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/models/app_language_model/app_language.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_language_state.dart';

class AppLanguageCubit extends HydratedCubit<AppLanguageState> {
  AppLanguageCubit() : super(const AppLanguageState());

  void setLocale(AppLanguage appLanguage) {
    emit(state.copyWith(appLanguage: appLanguage));
  }

  Locale get getLocale {
    return Locale(state.appLanguage.languageCode);
  }

  @override
  AppLanguageState? fromJson(Map<String, dynamic> json) {
    return AppLanguageState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppLanguageState state) {
    return state.toMap();
  }
}
