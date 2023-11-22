import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme lightColorsScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 78, 112, 248),
    primary: const Color.fromARGB(255, 78, 112, 248),
    secondary: Colors.white);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          buttonTheme: ButtonThemeData(colorScheme: lightColorsScheme),
          useMaterial3: true,
          colorScheme: lightColorsScheme,
          textTheme: const TextTheme().copyWith(
              headlineMedium: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white)),
          cardTheme:
              const CardTheme().copyWith(color: lightColorsScheme.secondary),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: lightColorsScheme.primary,
              foregroundColor: lightColorsScheme.secondary)),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
