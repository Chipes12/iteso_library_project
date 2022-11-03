import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'camera_bloc_event.dart';
part 'camera_bloc_state.dart';

class CameraBlocBloc extends Bloc<CameraBlocEvent, CameraBlocState> {
  CameraBlocBloc() : super(CameraBlocInitial()) {
    on<CameraBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
