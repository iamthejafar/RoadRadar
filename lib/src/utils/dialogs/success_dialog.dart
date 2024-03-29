import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app/theme/colors.dart';



void successDialog(BuildContext context,
    {String? message, Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: white,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 270.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            20.verticalSpace,
            Container(
              width: 82,
              height: 82,
              decoration: const BoxDecoration(
                color: mediumYellow,
                shape: BoxShape.circle,
              ),
              child: const Center(child: Icon(Icons.check,size: 50, color: white,)),
            ),
            14.verticalSpace,
            Text(
              "Successful",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            20.verticalSpace,
            Text(
              message ?? "Task completed successfully",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: ElevatedButton(
                onPressed: onPressed ?? () => Navigator.pop(context),
                child: const Text('Ok',style: TextStyle(color: black, fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
