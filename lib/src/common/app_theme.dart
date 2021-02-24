import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider {
  const ThemeProvider.__();

  static ThemeData getLightTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      accentColor: Colors.teal,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.sourceSansProTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }

  static ThemeData getDarkTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      accentColor: Colors.teal,
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.sourceSansProTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
