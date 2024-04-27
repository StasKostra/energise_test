import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
        fontFamily: 'SourceSans3',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1B4D34),
          secondary: Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
            titleLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30)));
  }
}
