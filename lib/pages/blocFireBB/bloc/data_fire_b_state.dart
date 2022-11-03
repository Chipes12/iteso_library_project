part of 'data_fire_b_bloc.dart';

abstract class DataFireBState extends Equatable {
  const DataFireBState();

  @override
  List<Object> get props => [];
}

class DataFireBInitial extends DataFireBState {}

class DataSearchingState extends DataFireBState {}

class DataFoundState extends DataFireBState {}

class DataNotFoundState extends DataFireBState {}
