import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_chat_app/signal_service/bloc/network/network_bloc.dart';
import 'package:flutter_chat_app/signal_service/bloc/network/network_events/network_notify.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}