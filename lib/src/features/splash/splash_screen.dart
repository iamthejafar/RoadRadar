import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/router/router.gr.dart';
import '../../constants/colors.dart';
import '../../utils/services/connectivity_service.dart';
import '../../utils/shared_preferences/shared_preferences.dart';

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


    Timer(const Duration(milliseconds: 600), () async {

      bool isOnline = false;

      isOnline = await ConnectivityService().checkInternetConnection();

      final userId = UserPreferences.userId;


     if(context.mounted){
       if(isOnline){
         if(userId != ""){
           context.router.replaceAll([const HomeRoute()]);
         }
         else{
           context.router.replaceAll([const AuthRoute()]);
         }
       }
       else{
         context.router.replaceAll([const NoInternetRoute()]);

       }
     }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'RoadSync',
              style: TextStyle(
                  color: blueColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
