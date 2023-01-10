import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectionStatus { isConnected, isDisconnected, isPending }

class ConnectionNotifier extends StateNotifier<ConnectionStatus> {
  StreamSubscription<ConnectivityResult>? connectStream;
  final _connectivity = Connectivity();
  ConnectionStatus? lastState;
  ConnectionStatus? newState;
  ConnectionNotifier() : super(ConnectionStatus.isPending) {
    if (state == ConnectionStatus.isConnected) {
      lastState = ConnectionStatus.isConnected;
    } else {
      lastState = ConnectionStatus.isDisconnected;
    }
    lastState = ConnectionStatus.isPending;
    connectStream =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
        case ConnectivityResult.ethernet:
          newState = ConnectionStatus.isConnected;
          break;
        case ConnectivityResult.none:
          newState = ConnectionStatus.isDisconnected;
          break;
        default:
      }
      if (newState != state) {
        state = newState!;
        lastState = newState;
      }
    });
  }
  @override
  void dispose() {
    connectStream?.cancel();
    super.dispose();
  }
}
