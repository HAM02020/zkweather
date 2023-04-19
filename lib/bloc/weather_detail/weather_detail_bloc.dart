import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:zk_weather/bloc/city_weather/city_weather_bloc.dart';
import 'package:zk_weather/bloc/top_city/topcity_bloc.dart';
import 'package:zk_weather/viewModel/weather_detail_view_model.dart';

part 'weather_detail_event.dart';
part 'weather_detail_state.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  CityWeatherBloc cityWeatherBloc;
  TopcityBloc topcityBloc;
  WeatherDetailBloc({required this.cityWeatherBloc, required this.topcityBloc})
      : super(WeatherDetailInitial(vmMap: Map<int, WeatherDetialViewModel>())) {
    on<WeatherDetailShouldLoadEvent>(_onWeatherDetialShouldLoad);
  }

  FutureOr<void> _onWeatherDetialShouldLoad(WeatherDetailShouldLoadEvent event,
      Emitter<WeatherDetailState> emit) async {
    emit(WeatherDetailLoadingState(vmMap: state.vmMap));

    if (state.vmMap?.containsKey(event.index) ?? false) {
      emit(WeatherDetailDidLoadState(vmMap: state.vmMap));
      return;
    }

    String? lon = topcityBloc.state.model?.topCityList?[event.index].lon;
    String? lat = topcityBloc.state.model?.topCityList?[event.index].lat;
    var vm = await WeatherDetialViewModel.load(
        cityName: cityWeatherBloc.state.list[event.index].cityName,
        location: "$lon,$lat");
    state.vmMap?.update(
      event.index,
      (value) => value,
      ifAbsent: () => vm,
    );
    emit(WeatherDetailDidLoadState(vmMap: state.vmMap));
    // cityWeatherBloc
    //     .add(CityWeatherShouldAddVMEvent(vm: vm, index: event.index));
  }
}
