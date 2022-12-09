
part of 'connection_bloc.dart';

abstract class ConnectionStatusState extends Equatable {
  const ConnectionStatusState();

  @override
  List<Object> get props => [];
}

class ConnectionInitial extends ConnectionStatusState {}

class ActiveConnectionState extends ConnectionStatusState {
  final String message;
  const ActiveConnectionState({
    required this.message,
  });
}

class InActiveConnectionState extends ConnectionStatusState {
  final String message;
  const InActiveConnectionState({
    required this.message,
  });
}
