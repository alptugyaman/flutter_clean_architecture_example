extension OridinalNumberExtension on int {
  String toOridinalNumber() {
    if (this < 0) throw Exception('Invalid Number');

    return switch (this) {
      1 => '${this}st',
      2 => '${this}nd',
      3 => '${this}rd',
      _ => '${this}th',
    };
  }
}
