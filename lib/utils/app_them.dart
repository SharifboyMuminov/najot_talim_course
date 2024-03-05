import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
    ),
    shadowColor: Colors.black,
    cardColor: const Color(0xFFFFFFFF),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(backgroundColor: Colors.white)),
    useMaterial3: true,
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.grey,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
    cardColor: const Color(0xFF252525),
    shadowColor: Colors.white,
  );
}
