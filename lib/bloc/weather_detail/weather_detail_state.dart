part of 'weather_detail_bloc.dart';

abstract class WeatherDetailState extends Equatable {
  Map<int, WeatherDetialViewModel>? vmMap;
  WeatherDetailState({required this.vmMap});

  @override
  List<Object> get props => [];
  WeatherDetailState copyWith({Map<int, WeatherDetialViewModel>? vm});
}

class WeatherDetailInitial extends WeatherDetailState {
  WeatherDetailInitial({super.vmMap});
  @override
  WeatherDetailInitial copyWith({Map<int, WeatherDetialViewModel>? vm}) {
    return WeatherDetailInitial(vmMap: vm);
  }
}

class WeatherDetailLoadingState extends WeatherDetailState {
  WeatherDetailLoadingState({required super.vmMap});
  @override
  WeatherDetailLoadingState copyWith({Map<int, WeatherDetialViewModel>? vm}) {
    return WeatherDetailLoadingState(vmMap: vm);
  }
}

class WeatherDetailDidLoadState extends WeatherDetailState {
  WeatherDetailDidLoadState({required super.vmMap});

  @override
  WeatherDetailDidLoadState copyWith({Map<int, WeatherDetialViewModel>? vm}) {
    return WeatherDetailDidLoadState(vmMap: vm);
  }
}
