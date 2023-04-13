import 'dart:async';

import 'package:date_format/date_format.dart' hide S;
import 'package:flutter/material.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/model/weather_now_model.dart';
import 'package:zk_weather/utils/network/api.dart';

class CityNowWeatherNotifier extends ChangeNotifier {
  String _strTime = '';
  String get strTime => strTime;

  final List _citys = [
    {"name": S.current.beijing, "lon": "116.20", "lat": "39.56"}
  ];

  List<WeatherNowModel> _cityWeatherList = [];
  List<WeatherNowModel> get cityWeatherList => _cityWeatherList;

  loadDataFromApi() async {
    _cityWeatherList.clear();
    for (var e in _citys) {
      var json = await Api.cityWeather(lon: e["lon"], lat: e["lat"]);
      WeatherNowModel model = WeatherNowModel.fromJson(json);
      _cityWeatherList.add(model);
    }
    notifyListeners();
  }
  loadShanghaiDataFromApi() async {
    _cityWeatherList.clear();
    for (var e in _citys) {
      var json = await Api.cityWeather(lon: '121', lat: '31');
      WeatherNowModel model = WeatherNowModel.fromJson(json);
      _cityWeatherList.add(model);
    }
    notifyListeners();
  }

  setupTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      String time = formatDate(DateTime.now(), [HH, ':', nn]);
      debugPrint(_strTime);
      if (_strTime == time) return;
      _strTime = time;
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    debugPrint("notifyListeners");
    super.notifyListeners();
  }
}
