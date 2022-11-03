part of 'camera_bloc_bloc.dart';

abstract class CameraBlocState extends Equatable {
  const CameraBlocState();

  @override
  List<Object> get props => [];
}

class CameraBlocInitial extends CameraBlocState {}

class CameraErrorState extends CameraBlocState {}

class CameraSuccessState extends CameraBlocState {}
