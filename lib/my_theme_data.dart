import 'package:flutter/material.dart';
import 'app_colors.dart';


class MyThemeData{
  //light mode and dark mode
  //no build here therefore hot restart
  static final ThemeData lightMode = ThemeData(//constant throughout app
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        )

    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w700
      ),
      bodySmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 22,
          fontWeight: FontWeight.bold
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.blackColor,
        showSelectedLabels: true, //default
        selectedIconTheme: IconThemeData(),
        backgroundColor: AppColors.primaryColor //msh betsama3
    ),

  );
}
