import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'db_change_events.dart';
part 'db_change_state.dart';

class DbChangeBloc extends Bloc<DbChangeEvent, DbChangeState> {
  DbChangeBloc(): super(const DbChangeState()) {
    on<InitialDbChangeEvent>(_initialDbChangeEvent);
  }

  //* InitialDbChangeEvent
  Future<void> _initialDbChangeEvent(InitialDbChangeEvent event, Emitter<DbChangeState> emit) async {
    
  }
}