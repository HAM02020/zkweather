part of 'weather_detail_bloc.dart';

abstract class WeatherDetailState extends Equatable {
  late int index;
  WeatherDetialViewModel? vm;
  WeatherDetailState({this.vm, this.index = 0});

  @override
  List<Object> get props => [];
}

class WeatherDetailInitial extends WeatherDetailState {
  WeatherDetailInitial();
}

class WeatherDetailLoadingState extends WeatherDetailState {
  WeatherDetailLoadingState();
}

class WeatherDetailDidLoadState extends WeatherDetailState {
  WeatherDetailDidLoadState({super.vm, required super.index});
}
