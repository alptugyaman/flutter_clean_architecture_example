import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/constants/secure_storage_keys.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecureStorage {
  SecureStorage(this.storage);
  final FlutterSecureStorage storage;

  Future<void> initLocalization() async {
    try {
      final locale = await getLocale();

      if (locale != null) {
        await setLocale(locale: Locale(locale));
      } else {
        await setLocale(locale: LocaleEnums.english.value);
      }
    } on Exception catch (_) {
      log('Error while setting locale to English');

      rethrow;
    }
  }

  Future<void> setLocale({required Locale locale}) async {
    try {
      await storage.write(
        key: SecureStorageKeys.locale,
        value: locale.languageCode,
      );

      log('Locale is set to $locale');
    } on Exception catch (_) {
      log('Error while setting locale to $locale');

      rethrow;
    }
  }

  Future<String?> getLocale() async {
    return storage.read(key: SecureStorageKeys.locale);
  }

  Future<void> removeKey({required String key}) async {
    log('$key is removed');

    await storage.delete(key: key);
  }

  Future<void> clearAll() async {
    log('storage is cleared');

    await storage.deleteAll();
  }
}
