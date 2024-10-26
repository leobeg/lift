import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 32, 32, 32),
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade100,
    onSurface: const Color.fromARGB(255, 255, 255, 255),
    onSurfaceVariant: const Color.fromARGB(255, 150, 150, 150),
    
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 32),
);