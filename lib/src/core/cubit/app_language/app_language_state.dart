part of 'app_language_cubit.dart';

class AppLanguageState extends Equatable {
  const AppLanguageState({
    this.appLanguage = const AppLanguage(languageCode: 'en'),
  });

  factory AppLanguageState.fromMap(Map<String, dynamic> map) {
    final json = map['languageCode'] as Map<String, dynamic>;

    final appLanguage = AppLanguage.fromJson(json);

    return AppLanguageState(
      appLanguage: appLanguage,
    );
  }

  final AppLanguage appLanguage;

  @override
  List<Object?> get props => [appLanguage];

  AppLanguageState copyWith({
    AppLanguage? appLanguage,
  }) {
    return AppLanguageState(
      appLanguage: appLanguage ?? this.appLanguage,
    );
  }

  Map<String, dynamic> toMap() {
    final json = appLanguage.toJson();

    return {
      'languageCode': json,
    };
  }
}
