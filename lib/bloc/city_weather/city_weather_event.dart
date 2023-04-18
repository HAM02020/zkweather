part of 'city_weather_bloc.dart';

@immutable
abstract class CityWeatherEvent {}

class CityWeatherWillLoadEvent extends CityWeatherEvent {}

class CityWeatherShouldAddVMEvent extends CityWeatherEvent {
  WeatherDetialViewModel vm;
  int index;

  CityWeatherShouldAddVMEvent({required this.vm, required this.index});
}
