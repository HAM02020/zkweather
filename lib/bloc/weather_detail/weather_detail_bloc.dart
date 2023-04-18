import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zk_weather/viewModel/weather_detail_view_model.dart';

part 'weather_detail_event.dart';
part 'weather_detail_state.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  WeatherDetailBloc() : super(WeatherDetailInitial()) {
    on<WeatherDetailShouldLoadEvent>(_onWeatherDetialShouldLoad);
  }

  FutureOr<void> _onWeatherDetialShouldLoad(WeatherDetailShouldLoadEvent event,
      Emitter<WeatherDetailState> emit) async {
    emit(WeatherDetailLoadingState());
    var vm = await WeatherDetialViewModel.load(
        cityName: event.name, location: event.location);
    emit(WeatherDetailDidLoadState(vm: vm));
  }
}
