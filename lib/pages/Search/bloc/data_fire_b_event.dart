part of 'data_fire_b_bloc.dart';

abstract class DataFireBEvent extends Equatable {
  const DataFireBEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends DataFireBEvent {
  final String? strToSearch;

  SearchEvent({required this.strToSearch});
}
