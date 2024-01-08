import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:traffic_safety/src/app/router/router.gr.dart';
import 'package:traffic_safety/src/utils/shared_preferences/shared_preferences.dart';

import '../../utils/services/connectivity_service.dart';





class RouteGuard extends AutoRouteGuard {

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async{
    bool isOnline = false;

    isOnline = await ConnectivityService().checkInternetConnection();

    final userId = UserPreferences.userId;


    if(isOnline){
      router.push(const HomeRoute());

      if(userId != ""){
      }
    }
    else{
      router.push(const NoInternetRoute());

    }
  }

}