part of 'topcity_bloc.dart';

abstract class TopcityState extends Equatable {
  TopCitysModel? model;
  TopcityState();

  @override
  List<Object> get props => [];
}

class TopcityInitial extends TopcityState {}

class TopcityLoadedState extends TopcityState {
  @override
  TopCitysModel? model;

  TopcityLoadedState({required this.model});
}
