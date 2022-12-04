part of '../change_in_database/db_change_bloc.dart';

abstract class DbChangeEvent extends Equatable {
  const DbChangeEvent();

  @override
  List<Object> get props => [];
}

class InitialDbChangeEvent extends DbChangeEvent {}