import 'dart:async';

import 'dart:io';

class ConnectivityService {
  factory ConnectivityService() {
    _singleton ??= ConnectivityService._();
    return _singleton!;
  }

  ConnectivityService._() {
    checkInternetConnection();
  }

  static ConnectivityService? _singleton;

  bool hasConnection = false;
  StreamController<bool> connectionChangeController =
  StreamController.broadcast();
  Stream<bool> get connectionChange => connectionChangeController.stream;

  Future<bool> checkInternetConnection() async {
    final bool previousConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }
}
