import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.primaryMain,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    appBarTheme: AppBarTheme(
      color: AppColors.indicatorsWarningMain,
      backgroundColor: AppColors.indicatorsWarningDark,
      titleTextStyle: const TextStyle(
        color: Colors.green,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ),
    dividerColor: Colors.white24,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    useMaterial3: true,
  );

  final darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    scaffoldBackgroundColor: const Color.fromARGB(248, 48, 48, 48),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color.fromARGB(48, 48, 48, 48),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ),
    dividerColor: Colors.white24,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    useMaterial3: true,
  );
}
