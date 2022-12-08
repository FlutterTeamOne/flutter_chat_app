part of 'connection_bloc.dart';

@immutable
abstract class ConnectionEvent {}

class ActiveConnectionEvent extends ConnectionEvent{}
class InActiveConnectionEvent extends ConnectionEvent{}
