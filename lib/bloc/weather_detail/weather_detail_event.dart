part of 'weather_detail_bloc.dart';

abstract class WeatherDetailEvent extends Equatable {
  const WeatherDetailEvent();

  @override
  List<Object> get props => [];
}

class WeatherDetailShouldLoadEvent extends WeatherDetailEvent {
  String name;
  String location;
  WeatherDetailShouldLoadEvent({required this.name, required this.location});
}

class WeatherDetailDidLoadEvent extends WeatherDetailEvent {}
