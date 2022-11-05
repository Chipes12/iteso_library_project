part of 'material_bloc.dart';

abstract class MaterialState extends Equatable {
  const MaterialState();
  
  @override
  List<Object> get props => [];
}

class MaterialInitial extends MaterialState {}

class MaterialRentSuccessState extends MaterialState {
    final dynamic rentedMaterial;

  const MaterialRentSuccessState({required this.rentedMaterial});

  @override
  List<Object> get props => rentedMaterial;
}

class MaterialRenteErrorState extends MaterialState {}

class MaterialNotAviableState extends MaterialState {}
