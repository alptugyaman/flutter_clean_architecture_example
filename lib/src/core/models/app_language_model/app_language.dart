import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_language.g.dart';

@JsonSerializable()
class AppLanguage extends Equatable {
  const AppLanguage({required this.languageCode});

  factory AppLanguage.fromJson(Map<String, dynamic> json) {
    return _$AppLanguageFromJson(json);
  }

  final String languageCode;

  Map<String, dynamic> toJson() => _$AppLanguageToJson(this);

  AppLanguage copyWith({
    String? languageCode,
  }) {
    return AppLanguage(
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  List<Object?> get props => [languageCode];
}
