import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_safety/src/constants/colors.dart';

class AppTheme {
  final themeDate = ThemeData(
    hintColor: blueColor,
    disabledColor: greyColor,
    dividerColor: greyColor,
    focusColor: mediumGreen,
    highlightColor: lightGreen,
    hoverColor: lightGreen,
    indicatorColor: deepGreen,
    canvasColor: whiteColor,
    primaryColor: deepGreen,
    cardColor: greyColor,
    dialogBackgroundColor: whiteColor,

    fontFamily: "BeVietnamPro",

    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: deepGreen,
      onPrimary: blackColor,
      secondary: deepGreen,
      onSecondary: darkGreyColor,
      error: Colors.deepOrange,
      onError: whiteColor,
      background: lightGreen,
      onBackground: blackColor,
      surface: mediumGreen,
      onSurface: blackColor,
    ),
    scaffoldBackgroundColor: whiteColor,
    splashColor: Colors.transparent,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: blackColor
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: blackColor
      ),
      displayMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: blackColor
      ),
      headlineLarge: TextStyle(
        color: blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500
      ),
      headlineMedium: TextStyle(
        color: blackColor,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp
      ),
      headlineSmall: TextStyle(
        color: blackColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500
      ),
    ),
  );
}
