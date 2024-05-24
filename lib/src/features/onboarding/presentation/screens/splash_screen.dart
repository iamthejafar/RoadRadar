import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadradar/src/core/app/theme/colors.dart';

import '../../../../core/app/router/router.gr.dart';
import '../../../../utils/services/connectivity_service.dart';
import '../../../../utils/shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 4000), () async {
      bool isOnline = false;

      isOnline = await ConnectivityService().checkInternetConnection();

      final userId = UserPreferences.userId;

      if (context.mounted) {
        if (isOnline) {
          if (userId != "") {
            context.router.replaceAll([const MainRoute()]);
          } else {
            context.router.replaceAll([const AuthRoute()]);
          }
        } else {
          context.router.replaceAll([const NoInternetRoute()]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: mediumYellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 0.5,
                ),
              ),
              AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                      "Road Radar",
                    speed: const Duration(milliseconds: 150),
                    textStyle: textTheme.displayLarge!.copyWith(fontSize: 40.sp),
                  ),
                ],
              )
            ],
          ),
          10.verticalSpace,
          SizedBox(
            height: 50.h,
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                FadeAnimatedText(
                  '',
                  duration: const Duration(milliseconds: 500),
                ),
                FadeAnimatedText(
                  'Empowering Communities',
                  textStyle: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                  duration: const Duration(milliseconds: 1000),
                ),
                FadeAnimatedText(
                  'Paving the Way to Safety!',
                  textStyle: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                  duration: const Duration(milliseconds: 1000),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
