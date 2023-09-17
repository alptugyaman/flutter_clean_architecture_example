import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString([dynamic locale]) {
    final formatter = DateFormat.yMd(locale).add_jm();
    return formatter.format(toLocal());
  }
}
