part of 'weather_detail_bloc.dart';

abstract class WeatherDetailEvent extends Equatable {
  const WeatherDetailEvent();

  @override
  List<Object> get props => [];
}

class WeatherDetailShouldLoadEvent extends WeatherDetailEvent {
  late int index;
  WeatherDetailShouldLoadEvent({required this.index});
}

class WeatherDetailDidLoadEvent extends WeatherDetailEvent {}
