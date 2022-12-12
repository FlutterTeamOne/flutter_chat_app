part of 'grpc_connection_bloc.dart';

enum GrpcConnectState {
  connecting,
  ready,
  transientFailure,
  idle,
  shutdown,
}

class GrpcConnectionState extends Equatable {
  final GrpcConnectState connectState;
  const GrpcConnectionState({this.connectState = GrpcConnectState.idle});
  GrpcConnectionState copyWith({
    GrpcConnectState? connectState,
  }) {
    return GrpcConnectionState(
      connectState: connectState ?? this.connectState,
    );
  }

  @override
  List<Object?> get props => [connectState];
}
