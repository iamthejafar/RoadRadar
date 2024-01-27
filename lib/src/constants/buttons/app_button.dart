import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadradar/src/core/app/theme/app_text_style.dart';

import '../../core/app/theme/colors.dart';



class AppButton extends StatelessWidget {
  const AppButton({
    super.key, this.onTap, required this.text,
  });
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10.r)
        //   ),
        //   minimumSize: const Size(double.infinity, 40),
        // ),
        onPressed: onTap,
        child: Text(
          text,
          // style: AppTextStyle.k14pxBlackW500,
        ));
  }
}
