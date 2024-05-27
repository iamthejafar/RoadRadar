
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:roadradar/src/core/app/router/router.gr.dart';


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
    AutoRoute(page: MainRoute.page, path: "/mainScreen",),
    AutoRoute(page: AddHazardIssueRoute.page, path: '/addIssue'),
    AutoRoute(page: ImagePreviewRoute.page, path: '/imagePreview'),
    AutoRoute(page: MapFullRoute.page, path: '/mapFullView'),
  ];
}
