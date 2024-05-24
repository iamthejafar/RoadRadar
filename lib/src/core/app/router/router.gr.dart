// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:latlong2/latlong.dart' as _i11;
import 'package:roadradar/src/comman/models/image_model.dart' as _i10;
import 'package:roadradar/src/comman/screens/no_internet_screen.dart' as _i6;
import 'package:roadradar/src/features/auth/presentation/screens/auth_screen.dart'
    as _i2;
import 'package:roadradar/src/features/hazard/presentation/screens/add_hazard_issue_screen.dart'
    as _i1;
import 'package:roadradar/src/features/home/presentation/screens/image_preview_screen.dart'
    as _i3;
import 'package:roadradar/src/features/home/presentation/screens/main_screen.dart'
    as _i4;
import 'package:roadradar/src/features/home/presentation/screens/map_full_screen.dart'
    as _i5;
import 'package:roadradar/src/features/onboarding/presentation/screens/splash_screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AddHazardIssueRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddHazardIssueScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    ImagePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ImagePreviewRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ImagePreviewScreen(
          key: args.key,
          images: args.images,
          initialPage: args.initialPage,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainScreen(),
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
/// [_i1.AddHazardIssueScreen]
class AddHazardIssueRoute extends _i8.PageRouteInfo<void> {
  const AddHazardIssueRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AddHazardIssueRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddHazardIssueRoute';

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
/// [_i3.ImagePreviewScreen]
class ImagePreviewRoute extends _i8.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    _i9.Key? key,
    required List<_i10.ImageModel> images,
    required int initialPage,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ImagePreviewRoute.name,
          args: ImagePreviewRouteArgs(
            key: key,
            images: images,
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
    required this.images,
    required this.initialPage,
  });

  final _i9.Key? key;

  final List<_i10.ImageModel> images;

  final int initialPage;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, images: $images, initialPage: $initialPage}';
  }
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MapFullScreen]
class MapFullRoute extends _i8.PageRouteInfo<MapFullRouteArgs> {
  MapFullRoute({
    _i9.Key? key,
    required List<_i11.LatLng> coordinates,
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

  final List<_i11.LatLng> coordinates;

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
