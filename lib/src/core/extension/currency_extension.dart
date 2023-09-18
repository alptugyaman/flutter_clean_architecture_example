import 'package:intl/intl.dart';

extension CurrencyExtension on num {
  String formatAsCurrency() {
    final formatter = NumberFormat.simpleCurrency(locale: 'en_US');
    return formatter.format(this);
  }
}
