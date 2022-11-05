import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_fire_b_event.dart';
part 'data_fire_b_state.dart';

class DataFireBBloc extends Bloc<DataFireBEvent, DataFireBState> {
  DataFireBBloc() : super(DataFireBInitial()) {
    on<SearchEvent>(_getData);
  }

  FutureOr<void> _getData(event, emit) {
    // TODO: implement event handler
  }
}
