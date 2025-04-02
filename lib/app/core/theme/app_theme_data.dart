import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static const Color _primaryColor = Color(0xFF7a5d3e);
  static const Color _inputErrorColor = Color(0xFFD36161);
  static const Color _inputFillColor = Color(0xffF8F8FA);
  static const Color _backgroundColor = Color(0xffFfffff);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _backgroundColor,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xff212229),
      contentTextStyle: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: _backgroundColor, foregroundColor: _primaryColor, elevation: 0),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent, elevation: 0),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
        backgroundColor: const WidgetStatePropertyAll(_primaryColor),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(40, 40)),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: const WidgetStatePropertyAll(_primaryColor),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.plusJakartaSans(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xff494A57)),
      labelStyle: GoogleFonts.plusJakartaSans(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: const Color(0xff494A57),
      ),
      errorStyle: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w500, color: _inputErrorColor),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: _primaryColor, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: _inputErrorColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: _inputErrorColor, width: 2),
      ),
      fillColor: _inputFillColor,
      filled: true,
    ),
    textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
      bodyMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      titleSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xff212229),
        letterSpacing: -1.7,
      ),
      bodyLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff9496AA),
        letterSpacing: -0.7,
      ),
      labelMedium: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff494A57)),
    ),
  );
}
