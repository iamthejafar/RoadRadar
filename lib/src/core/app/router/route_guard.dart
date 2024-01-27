import 'package:auto_route/auto_route.dart';
import 'package:roadradar/src/core/app/router/router.gr.dart';


import '../../../utils/services/connectivity_service.dart';
import '../../../utils/shared_preferences/shared_preferences.dart';





class RouteGuard extends AutoRouteGuard {

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
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