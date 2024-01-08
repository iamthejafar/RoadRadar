import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_safety/src/constants/colors.dart';

class AppTheme {
  final themeDate = ThemeData(
    fontFamily: "BeVietnamPro",
    canvasColor: Colors.white,
    primaryColor: deepGreen,
    useMaterial3: true,
    cardColor: greyColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: deepGreen,
      onPrimary: blackColor,
      secondary: deepGreen,
      onSecondary: darkGreyColor,
      error: Colors.deepOrange,
      onError: Colors.white,
      background: lightGreen,
      onBackground: blackColor,
      surface: mediumGreen,
      onSurface: blackColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.transparent,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: blackColor
      ),
    ),
    highlightColor: Colors.transparent,
  );
}
