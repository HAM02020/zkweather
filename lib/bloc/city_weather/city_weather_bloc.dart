import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/model/weather_now_model.dart';
import 'package:zk_weather/utils/network/api.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  final List _citys = [
    {"name": S.current.beijing, "lon": "116.20", "lat": "39.56"}
  ];
  CityWeatherBloc() : super(CityWeatherInitial()) {
    on<CityWeatherLoadEvent>(_onCityWeatherLoad);
  }

  FutureOr<void> _onCityWeatherLoad(
      CityWeatherEvent event, Emitter<CityWeatherState> emit) async {
    emit(CityWeatherLoadingState());
    emit(CityWeatherInitial());
    for (var e in _citys) {
      var json = await Api.cityWeather(lon: e["lon"], lat: e["lat"]);
      WeatherNowModel model = WeatherNowModel.fromJson(json);
      state.list.add(model);
    }
    emit(CityWeatherLoadingEndState(list: state.list));
  }

  @override
  void onChange(Change<CityWeatherState> change) {
    super.onChange(change);

    //debugPrint("${state}");
  }
}
