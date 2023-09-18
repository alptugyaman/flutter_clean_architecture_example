import 'package:flutter/material.dart';

enum LocaleEnums {
  english(Locale('en')),
  turkish(Locale('tr'));

  const LocaleEnums(this.value);
  final Locale value;
}
