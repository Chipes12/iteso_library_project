part of 'material_bloc.dart';

abstract class MaterialEvent extends Equatable {
  const MaterialEvent();

  @override
  List<Object> get props => [];
}

class RentMaterialEvent extends MaterialEvent {
    final dynamic  material;

  RentMaterialEvent({required this.material});

  @override
  List<Object> get props => [material];
}
