part of 'city_weather_bloc.dart';

@immutable
class CityWeatherState extends Equatable {
  List<CityListItemViewModel> list = [];

  @override
  List<Object?> get props => [list];
}

class CityWeatherInitialState extends CityWeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CityWeatherLoadingState extends CityWeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CityWeatherDidLoadState extends CityWeatherState {
  @override
  late List<CityListItemViewModel> list;

  CityWeatherDidLoadState({required this.list});
}
