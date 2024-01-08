import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_safety/src/app/router/router.dart';
import 'package:traffic_safety/src/app/theme/app_theme.dart';



class App extends ConsumerWidget{
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(context,WidgetRef ref){
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context,child){
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationProvider: _appRouter.routeInfoProvider(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(
              _appRouter,
              navigatorObservers: () => [AppRouteObserver()]
          ),
          onGenerateTitle: (context) => "RoadSync",
          theme: AppTheme().themeDate,
          // routes: _appRouter.routes,
        );
      },
    );
  }
}

