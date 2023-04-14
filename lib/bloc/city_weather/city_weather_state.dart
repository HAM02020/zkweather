part of 'city_weather_bloc.dart';

@immutable
class CityWeatherState extends Equatable {
  List<WeatherNowModel> list = [];

  List<Object?> get props => [list];
}

class CityWeatherInitial extends CityWeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CityWeatherLoadingState extends CityWeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CityWeatherLoadingEndState extends CityWeatherState {
  @override
  late List<WeatherNowModel> list;

  CityWeatherLoadingEndState({required this.list});

  @override
  List<Object?> get props => super.props;
}
