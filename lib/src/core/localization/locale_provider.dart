import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale = LocaleEnums.english.value;
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
