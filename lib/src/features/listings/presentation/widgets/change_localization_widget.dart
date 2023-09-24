import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/cubit/app_language/app_language_cubit.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';
import 'package:flutter_clean_architecture/src/core/models/app_language_model/app_language.dart';
import 'package:provider/provider.dart';

class ChangeLocalizationWidget extends StatelessWidget {
  const ChangeLocalizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<AppLanguageCubit>();

    final locale = localeProvider.getLocale == LocaleEnums.turkish.value
        ? LocaleEnums.english.value
        : LocaleEnums.turkish.value;

    final flag = localeProvider.getLocale == LocaleEnums.turkish.value
        ? FlagEnums.english.value
        : FlagEnums.turkish.value;

    return RawMaterialButton(
      onPressed: () {
        localeProvider.setLocale(
          AppLanguage(languageCode: locale.languageCode),
        );
      },
      child: Text(
        flag,
        style: const TextStyle(
          fontSize: 32,
        ),
      ),
    );
  }
}
