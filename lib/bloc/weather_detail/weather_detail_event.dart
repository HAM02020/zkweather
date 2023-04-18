part of 'weather_detail_bloc.dart';

abstract class WeatherDetailEvent extends Equatable {
  const WeatherDetailEvent();

  @override
  List<Object> get props => [];
}

class WeatherDetailShouldLoadEvent extends WeatherDetailEvent {
  String name;
  String location;
  late int index;
  WeatherDetailShouldLoadEvent(
      {required this.name, required this.location, required this.index});
}

class WeatherDetailDidLoadEvent extends WeatherDetailEvent {}
