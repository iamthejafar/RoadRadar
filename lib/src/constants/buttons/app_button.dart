import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';



class AppButton extends StatelessWidget {
  const AppButton({
    super.key, this.onTap, required this.text,
  });
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)
          ),
          minimumSize: Size(double.infinity, 40),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
        ));
  }
}
