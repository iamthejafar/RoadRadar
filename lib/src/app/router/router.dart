
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traffic_safety/src/app/router/route_guard.dart';
import 'package:traffic_safety/src/app/router/router.gr.dart';
import 'package:traffic_safety/src/features/auth/view/auth_screen.dart';
import 'package:traffic_safety/src/features/home/screens/map_full_screen_view.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint("Going to : ${route.settings.name}");
  }
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: "/splashScreen",initial: true ),
    AutoRoute(page: AuthRoute.page, path: "/authScreen", ),
    AutoRoute(page: NoInternetRoute.page, path: "/noInternet"),
    AutoRoute(page: HomeRoute.page, path: "/homeScreen",),
    AutoRoute(page: AddIssueRoute.page, path: '/addIssue'),
    AutoRoute(page: ImagePreviewRoute.page, path: '/imagePreview'),
    AutoRoute(page: MapFullRoute.page, path: '/mapFullView'),
  ];
}
