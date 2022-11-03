part of 'camera_bloc_bloc.dart';

abstract class CameraBlocEvent extends Equatable {
  const CameraBlocEvent();

  @override
  List<Object> get props => [];
}

class OpenCameraEvent extends CameraBlocEvent {}
