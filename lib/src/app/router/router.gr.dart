// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:latlong2/latlong.dart' as _i10;
import 'package:traffic_safety/src/features/add_incidents/add_incident_screen.dart'
    as _i1;
import 'package:traffic_safety/src/features/auth/view/auth_screen.dart' as _i2;
import 'package:traffic_safety/src/features/error/screens/no_internet_screen.dart'
    as _i6;
import 'package:traffic_safety/src/features/home/screens/home_screen.dart'
    as _i3;
import 'package:traffic_safety/src/features/home/screens/image_preview_screen.dart'
    as _i4;
import 'package:traffic_safety/src/features/home/screens/map_full_screen_view.dart'
    as _i5;
import 'package:traffic_safety/src/features/splash/splash_screen.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AddIssueRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddIssueScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    ImagePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ImagePreviewRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ImagePreviewScreen(
          key: args.key,
          urls: args.urls,
          initialPage: args.initialPage,
        ),
      );
    },
    MapFullRoute.name: (routeData) {
      final args = routeData.argsAs<MapFullRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MapFullScreen(
          key: args.key,
          coordinates: args.coordinates,
        ),
      );
    },
    NoInternetRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NoInternetScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddIssueScreen]
class AddIssueRoute extends _i8.PageRouteInfo<void> {
  const AddIssueRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AddIssueRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddIssueRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i8.PageRouteInfo<void> {
  const AuthRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ImagePreviewScreen]
class ImagePreviewRoute extends _i8.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i9.Key? key,
    required List<String> urls,
    required int initialPage,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ImagePreviewRoute.name,
          args: ImagePreviewRouteArgs(
            key: key,
            urls: urls,
            initialPage: initialPage,
          ),
          initialChildren: children,
        );

  static const String name = 'ImagePreviewRoute';

  static const _i8.PageInfo<ImagePreviewRouteArgs> page =
      _i8.PageInfo<ImagePreviewRouteArgs>(name);
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({
    this.key,
    required this.urls,
    required this.initialPage,
  });

  final _i9.Key? key;

  final List<String> urls;

  final int initialPage;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, urls: $urls, initialPage: $initialPage}';
  }
}

/// generated route for
/// [_i5.MapFullScreen]
class MapFullRoute extends _i8.PageRouteInfo<MapFullRouteArgs> {
  MapFullRoute({
    _i9.Key? key,
    required List<_i10.LatLng> coordinates,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          MapFullRoute.name,
          args: MapFullRouteArgs(
            key: key,
            coordinates: coordinates,
          ),
          initialChildren: children,
        );

  static const String name = 'MapFullRoute';

  static const _i8.PageInfo<MapFullRouteArgs> page =
      _i8.PageInfo<MapFullRouteArgs>(name);
}

class MapFullRouteArgs {
  const MapFullRouteArgs({
    this.key,
    required this.coordinates,
  });

  final _i9.Key? key;

  final List<_i10.LatLng> coordinates;

  @override
  String toString() {
    return 'MapFullRouteArgs{key: $key, coordinates: $coordinates}';
  }
}

/// generated route for
/// [_i6.NoInternetScreen]
class NoInternetRoute extends _i8.PageRouteInfo<void> {
  const NoInternetRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NoInternetRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
