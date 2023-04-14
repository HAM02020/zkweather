import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zk_weather/bloc/top_city/topcity_bloc.dart';
import 'package:zk_weather/common/global.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/model/top_citys/top_city.dart';
import 'package:zk_weather/model/weather_now/weather_now_model.dart';
import 'package:zk_weather/utils/network/api.dart';
import 'package:zk_weather/viewModel/city_list_item_view_model.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  final TopcityBloc topcityBloc;
  late final StreamSubscription _topcityBlocSubscription;
  CityWeatherBloc({required this.topcityBloc})
      : super(CityWeatherInitialState()) {
    _topcityBlocSubscription = topcityBloc.stream.listen(_onTopcityBlocStream);
    on<CityWeatherLoadEvent>(_onCityWeatherLoad);
  }

  FutureOr<void> _onCityWeatherLoad(
      CityWeatherEvent event, Emitter<CityWeatherState> emit) async {
    emit(CityWeatherLoadingState());
    emit(CityWeatherInitialState());
    for (TopCityModel e in topcityBloc.state.model?.topCityList ?? []) {
      var json = await Api.cityWeather(lon: e.lon, lat: e.lat);
      WeatherNowModel weatherNowModel = WeatherNowModel.fromJson(json);
      CityListItemViewModel viewModel = CityListItemViewModel(
          weatherNowModel: weatherNowModel, topCityModel: e);
      state.list.add(viewModel);
    }
    emit(CityWeatherLoadingEndState(list: state.list));
  }

  void _onTopcityBlocStream(topcityState) async {
    if (topcityState is TopcityLoadedState) {
      emit(CityWeatherLoadingState());
      emit(CityWeatherInitialState());
      for (TopCityModel e in topcityState.model?.topCityList ?? []) {
        var json = await Api.cityWeather(lon: e.lon, lat: e.lat);
        WeatherNowModel weatherNowModel = WeatherNowModel.fromJson(json);
        CityListItemViewModel viewModel = CityListItemViewModel(
            weatherNowModel: weatherNowModel, topCityModel: e);
        state.list.add(viewModel);
      }
      emit(CityWeatherLoadingEndState(list: state.list));
    }
  }

  @override
  void onChange(Change<CityWeatherState> change) {
    super.onChange(change);

    //debugPrint("${state}");
  }
}
