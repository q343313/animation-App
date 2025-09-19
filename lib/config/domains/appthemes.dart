



import 'package:flutter/material.dart';
import 'package:messanger/config/domains/appcolor.dart';

class AppThemes {
  static final ThemeData lightthemedata= ThemeData(
    scaffoldBackgroundColor:  AppColors.scaffoldlightmode,
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColors.textlightmode),
      bodyMedium: TextStyle(color: AppColors.textlightmode),
      bodyLarge: TextStyle(color: AppColors.textlightmode),
      // headlineMedium: TextStyle(),
      // headlineLarge: TextStyle(),
      // headlineSmall: TextStyle(),
      // titleMedium: TextStyle(),
      // titleLarge: TextStyle(),
      // titleSmall: TextStyle()
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: AppColors.buttonlightmode,
        textStyle: TextStyle(color: Colors.white,fontSize: 23,fontFamily: "heading_c")
      )
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: AppColors.textlightmode,fontFamily: "heading_c",fontSize: 20),
      centerTitle: true,
      backgroundColor: AppColors.scaffoldlightmode,

    )
  );
  static final ThemeData darkthemedata = ThemeData(
      scaffoldBackgroundColor:  AppColors.scaffolddarkmode,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodySmall: TextStyle(color: AppColors.textdarkmode),
        bodyMedium: TextStyle(color: AppColors.textdarkmode),
        bodyLarge: TextStyle(color: AppColors.textdarkmode),
        // headlineMedium: TextStyle(),
        // headlineLarge: TextStyle(),
        // headlineSmall: TextStyle(),
        // titleMedium: TextStyle(),
        // titleLarge: TextStyle(),
        // titleSmall: TextStyle()
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              backgroundColor: AppColors.buttondarkmode,
              textStyle: TextStyle(color: AppColors.scaffolddarkmode,fontSize: 23,fontFamily: "heading_c")
          )
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: AppColors.textdarkmode,fontFamily: "heading_c",fontSize: 20),
          centerTitle: true,
          backgroundColor: AppColors.scaffolddarkmode
      )
  );
}