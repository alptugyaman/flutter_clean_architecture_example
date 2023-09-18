import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/core/cache/secure_storage.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';

class LocaleProvider with ChangeNotifier {
  LocaleProvider(this._secureStorage);
  final SecureStorage _secureStorage;

  Locale? _locale;
  Locale? get locale => _locale;

  Future<bool> initLocale() async {
    try {
      await _secureStorage.initLocalization();

      final initLocale = await _secureStorage.getLocale();

      _locale =
          initLocale != null ? Locale(initLocale) : LocaleEnums.english.value;

      notifyListeners();

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;

    _locale = locale;

    _secureStorage.setLocale(locale: locale);

    notifyListeners();
  }

  void clearLocale() {
    _locale = LocaleEnums.english.value;
    notifyListeners();
  }
}
