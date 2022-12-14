import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionStatusState> {
  StreamSubscription<ConnectivityResult>? connectStream;
  final _connectivity = Connectivity();
  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  ConnectionBloc() : super(ConnectionInitial()) {
    on<ConnectionEvent>((event, emit) => event is ActiveConnectionEvent
        ? emit(const ActiveConnectionState(message: 'connection Active'))
        : emit(const InActiveConnectionState(message: 'connection Inactive')));

    connectStream = _connectivity.onConnectivityChanged.listen(
        (ConnectivityResult result) => result == ConnectivityResult.wifi ||
                result == ConnectivityResult.mobile ||
                result == ConnectivityResult.ethernet
            ? add(ActiveConnectionEvent())
            : add(InActiveConnectionEvent()));
  }

  @override
  Future<void> close() {
    connectStream?.cancel();
    return super.close();
  }
}
