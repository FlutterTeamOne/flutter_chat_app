part of '../change_in_database/db_change_bloc.dart';

enum DbChangeStatus { initial, loading, success, failure }

class DbChangeState extends Equatable {
  final DbChangeStatus status;

  const DbChangeState({
    this.status = DbChangeStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isLoading => status == DbChangeStatus.loading;

  DbChangeState copyWith({
    DbChangeStatus? status,
  }) {
    return DbChangeState(
      status: status ?? this.status,
    );
  }
}