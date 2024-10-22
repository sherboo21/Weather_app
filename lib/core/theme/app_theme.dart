import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainAppColor),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
        ),
        dividerColor: Colors.grey,
        brightness: Brightness.light,
      ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ));
}
