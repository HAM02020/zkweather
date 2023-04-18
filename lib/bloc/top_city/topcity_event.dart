part of 'topcity_bloc.dart';

abstract class TopcityEvent extends Equatable {
  const TopcityEvent();

  @override
  List<Object> get props => [];
}

class TopcityLoadEvent extends TopcityEvent {}
