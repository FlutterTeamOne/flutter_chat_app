
import 'package:flutter_bloc/flutter_bloc.dart';
import 'network_events/network_notify.dart';
import 'network_events/network_observe.dart';
import 'network_state/abstract_network_state.dart';
import 'network_state/network_failure.dart';
import 'network_state/network_initial.dart';
import 'network_state/network_success.dart';
import 'network_helper.dart';


import 'network_events/abstract_network_events.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  factory NetworkBloc() => _instance;

  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}