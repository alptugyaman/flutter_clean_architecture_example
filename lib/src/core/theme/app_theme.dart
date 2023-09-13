import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.lightBlueAccent[900],
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      );
}
