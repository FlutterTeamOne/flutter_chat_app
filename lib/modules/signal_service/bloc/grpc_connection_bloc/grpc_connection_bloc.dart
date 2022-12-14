import 'dart:async';

import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

import '../../service_locator/locator.dart';

part 'grpc_connection_event.dart';
part 'grpc_connection_state.dart';

class GrpcConnectionBloc
    extends Bloc<GrpcConnectionEvent, GrpcConnectionState> {
  final ConnectionBloc connectionBloc;
  final GrpcClient grpcClient;
  late StreamSubscription subscription;
  GrpcConnectionBloc(this.grpcClient, this.connectionBloc)
      : super(const GrpcConnectionState()) {
    on<GrpcConnectionStarted>(_onGrpcConnectionStarted);
  }

  FutureOr<void> _onGrpcConnectionStarted(
      GrpcConnectionStarted event, Emitter<GrpcConnectionState> emit) async {
    await for (var connectState in connectionBloc.stream) {
      if (connectState is ActiveConnectionState) {
        GrpcMessagesClient(grpcClient.channel).connecting(Empty());
        await for (var grpcState
            in grpcClient.channel.onConnectionStateChanged) {
          switch (grpcState) {
            case ConnectionState.connecting:
              emit(state.copyWith(connectState: GrpcConnectState.connecting));
              print('grpc connecting:$grpcState');
              break;
            case ConnectionState.ready:
              emit(state.copyWith(connectState: GrpcConnectState.ready));
              print('grpc ready:$grpcState');
              break;
            case ConnectionState.idle:
              emit(state.copyWith(connectState: GrpcConnectState.idle));
              print('grpc idle:$grpcState');
              break;
            case ConnectionState.shutdown:
              emit(state.copyWith(connectState: GrpcConnectState.shutdown));
              print('grpc shutdown:$grpcState');
              break;
            case ConnectionState.transientFailure:
              emit(state.copyWith(
                  connectState: GrpcConnectState.transientFailure));
              print('grpc transientFailure:$grpcState');
              break;
            default:
              emit(state.copyWith(connectState: GrpcConnectState.connecting));
          }
        }
      }
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
