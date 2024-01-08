import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_safety/src/constants/colors.dart';

void showErrorDialog(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.verticalSpace,
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
              20.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  context.router.pop();
                },
                child: Text(
                  'Ok',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        )),
      );
    },
  );
}
