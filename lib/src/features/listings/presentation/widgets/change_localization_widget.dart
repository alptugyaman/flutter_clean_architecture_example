import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';
import 'package:flutter_clean_architecture/src/core/localization/locale_provider.dart';
import 'package:provider/provider.dart';

class ChangeLocalizationWidget extends StatelessWidget {
  const ChangeLocalizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();

    final locale = localeProvider.locale == LocaleEnums.turkish.value
        ? LocaleEnums.english.value
        : LocaleEnums.turkish.value;

    final flag = localeProvider.locale == LocaleEnums.turkish.value
        ? FlagEnums.english.value
        : FlagEnums.turkish.value;

    return RawMaterialButton(
      onPressed: () => localeProvider.setLocale(locale),
      child: Text(
        flag,
        style: const TextStyle(
          fontSize: 32,
        ),
      ),
    );
  }
}
