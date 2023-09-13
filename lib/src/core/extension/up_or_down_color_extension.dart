import 'package:flutter/material.dart';

extension UpOrDownColorExtension on double {
  Color get upOrDownColor => this > 0
      ? Colors.green
      : this < 0
          ? Colors.red
          : Colors.grey;
}
