



import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart' as geo;

class LocationService {
  late Location _location;
  bool _serviceEnabled = false;
  PermissionStatus? _grantedPermission;

  LocationService() {
    _location = Location();
  }

  Future<bool> _checkPermission() async {
    if (await _checkService()) {
      _grantedPermission = await _location.hasPermission();
      if (_grantedPermission == PermissionStatus.denied) {
        _grantedPermission = await _location.requestPermission();
      }
    }

    return _grantedPermission == PermissionStatus.granted;
  }

  Future<bool> _checkService() async {
    try {
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
      }
    } on PlatformException catch (error) {
      debugPrint('error code is ${error.code} and message = ${error.message}');
      _serviceEnabled = false;
      await _checkService();
    }

    return _serviceEnabled;
  }

  Future<geo.Position?> getLocation() async {
    if (await _checkPermission()) {
      try {
        final geo.Position locationData =
        await geo.Geolocator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.high,
          timeLimit: const Duration(seconds: 2),
        );

        return locationData;
      } catch (e) {
        final geo.Position locationData =
        await geo.Geolocator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.medium,
        );
        return locationData;
      }
    }
    return null;
  }
}
