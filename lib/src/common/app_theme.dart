import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider {
  const ThemeProvider.__();

  static ThemeData getLightTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }

  static ThemeData getDarkTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
