import 'dart:async';

import 'package:date_format/date_format.dart' hide S;
import 'package:flutter/material.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/utils/network/api.dart';

class CityNowWeatherNotifier extends ChangeNotifier {
  String _strTime = '';
  String get strTime => strTime;

  List citys = [
    {"name": S.current.beijing, "lon": "116.20", "lat": "39.56"}
  ];

  late List _cityWeatherList;
  List get cityWeatherList => _cityWeatherList;

  loadDataFromApi() async {
    _cityWeatherList = [
      ...citys.map((e) async {
        return await Api.cityWeather(lon: e["lon"], lat: e["lat"]);
      })
    ];
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
    super.notifyListeners();
  }
}
