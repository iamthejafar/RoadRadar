import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  final themeData = ThemeData(
    hintColor: mediumBlue,
    disabledColor: grey,
    dividerColor: grey,
    focusColor: mediumYellow,
    highlightColor: lightYellow,
    hoverColor: lightYellow,
    indicatorColor: deepYellow,
    canvasColor: white,
    primaryColor: deepYellow,
    cardColor: grey,
    dialogBackgroundColor: white,
    fontFamily: "BeVietnamPro",
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: deepYellow,
      onPrimary: black,
      secondary: deepYellow,
      onSecondary: darkGrey,
      error: Colors.deepOrange,
      onError: white,
      background: lightYellow,
      onBackground: black,
      surface: mediumYellow,
      onSurface: black,
    ),
    scaffoldBackgroundColor: white,
    splashColor: Colors.transparent,
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.w600, color: mediumBlue),
      displaySmall: TextStyle(
          fontSize: 12.sp, fontWeight: FontWeight.w500, color: mediumBlue),
      displayMedium: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w500, color: mediumBlue),
      headlineLarge: TextStyle(
          color: black, fontSize: 16.sp, fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(
          color: black, fontWeight: FontWeight.w500, fontSize: 14.sp),
      headlineSmall: TextStyle(
          color: black, fontSize: 12.sp, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
          color: mediumBlue, fontSize: 16.sp, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(
          color: mediumBlue, fontWeight: FontWeight.w500, fontSize: 14.sp),
      titleSmall: TextStyle(
          color: mediumBlue, fontSize: 14.sp, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: black, fontSize: 20.sp, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          fontSize: 14.sp, fontWeight: FontWeight.w500, color: black),
      bodySmall: TextStyle(
          color: black, fontWeight: FontWeight.w500, fontSize: 12.sp),
      labelLarge: TextStyle(
          color: mediumBlue, fontWeight: FontWeight.w600, fontSize: 16.sp),
      labelMedium: TextStyle(
          color: mediumBlue, fontWeight: FontWeight.w500, fontSize: 14.sp),
      labelSmall: TextStyle(
          color: mediumBlue, fontWeight: FontWeight.w400, fontSize: 12.sp),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const MaterialStatePropertyAll(deepBlue),
        textStyle: MaterialStatePropertyAll(
            TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
            )
        )
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        enableFeedback: true,
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          } else {
            return mediumYellow;
          }
        }),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return 0;
          } else {
            return 1;
          }
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return darkGrey.withOpacity(0.5);
          } else {
            return mediumBlue;
          }
        }),
        overlayColor: MaterialStatePropertyAll(white.withOpacity(0.3)),
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 35.h)),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: grey,
      border: textFieldBorder,
      enabledBorder: textFieldBorder,
      disabledBorder: textFieldBorder,
      hintStyle: TextStyle(
        color: darkGrey,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(mediumBlue)
      )
    ),
    iconTheme: const IconThemeData(
      color: mediumBlue,
    )
  );
}
final textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.r),
  borderSide: const BorderSide(color: grey),
);