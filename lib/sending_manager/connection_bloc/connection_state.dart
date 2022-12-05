part of 'connection_bloc.dart';

@immutable
abstract class ConnectionStatusState {}

class ConnectionInitial extends ConnectionStatusState {}

class ActiveConnectionState extends ConnectionStatusState {
  final String message;
<<<<<<< HEAD

=======
>>>>>>> origin/sending_manager
  ActiveConnectionState({
    required this.message,
  });
}

class InactiveConnectionState extends ConnectionStatusState {
  final String message;
  InactiveConnectionState({
    required this.message,
  });
}
