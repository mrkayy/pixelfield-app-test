import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectivityController =
      StreamController<bool>.broadcast();

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  Stream<bool> get onConnectivityChanged => _connectivityController.stream;

  ConnectivityService() {
    _init();
  }

  void _init() async {
    await checkForConnectivity(); // Check on startup
    _connectivity.onConnectivityChanged.listen((result) {
      _isConnected = _mapConnectivityResultToBool(result);
      _connectivityController.add(_isConnected);
    });
  }

  Future<bool> checkForConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _isConnected = _mapConnectivityResultToBool(result);
      debugPrint("CHECKER_INITIALIZED_NOWNOWNOWNOWNOW $_isConnected");
      return _isConnected;
    } catch (e) {
      debugPrint("Connectivity check failed: $e");
      _isConnected = false;
      return false;
    }
  }

  bool _mapConnectivityResultToBool(List<ConnectivityResult> result) {
    return result.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet,
    );
  }

  Future<T?> runWhenConnected<T>(Future<T> Function() task) async {
    final connected = await checkForConnectivity();
    if (!connected) {
      debugPrint('No internet. Task skipped.');
      return null;
    }
    return await task();
  }

  void dispose() {
    _connectivityController.close();
  }
}
