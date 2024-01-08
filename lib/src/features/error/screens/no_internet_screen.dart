import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_safety/src/app/router/router.gr.dart';
import 'package:traffic_safety/src/constants/colors.dart';

@RoutePage()
class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'No Internet',
              style: TextStyle(
                  color: blackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.router.replaceAll([const SplashRoute()]);
            },
            child: const Text(
              'Try again',
              style: TextStyle(color: blackColor),
            ),
          )
        ],
      ),
    );
  }
}
