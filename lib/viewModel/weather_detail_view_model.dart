import 'dart:async';
import 'package:flutter/material.dart';

import 'package:zk_weather/model/weather7_days/weather7_days.dart';
import 'package:zk_weather/model/weather_detail/weather_detail.dart';
import 'package:zk_weather/utils/network/api.dart';

class WeatherDetialViewModel {
  //100晴101多云
  final table = [
    //[状态码,天气,白天是否可用,黑夜是否可用]
    [100, '晴', 1, 0],
    [101, '多云', 1, 0],
    [102, '少云', 1, 0],
    [103, '晴间多云', 1, 0],
    [104, '阴', 1, 1],
    [150, '晴', 0, 1],
    [151, '多云', 0, 1],
    [152, '少云', 0, 1],
    [153, '晴间多云', 0, 0],
  ];
  List<String>? dateList;
  List<WeatherDetailItemViewModel>? detailItemList;
  List<Weather7DaysItemViewModel>? weather7Daylist;
  List<double>? tempMaxList;
  List<double>? tempMinList;

  WeatherDetialViewModel._init();
  static FutureOr<WeatherDetialViewModel> load(location) async {
    WeatherDetialViewModel vm = WeatherDetialViewModel._init();

    var jsonDetail = await Api.weatherDetail(location);
    var json7Days = await Api.weather7Days(location);
    var wdm = WeatherDetail.fromJson(jsonDetail);
    var w7m = Weather7Days.fromJson(json7Days);

    vm.dateList =
        w7m.daily?.map((e) => e.fxDate?.substring(5)).cast<String>().toList();
    vm.detailItemList = [
      WeatherDetailItemViewModel(
          iconPath: "",
          name: "${wdm.now?.windScale}级",
          tip: "${wdm.now?.windDir}"),
      WeatherDetailItemViewModel(
          iconPath: "", name: "${wdm.now?.humidity}%", tip: "湿度"),
      WeatherDetailItemViewModel(
          iconPath: "", name: "${wdm.now?.feelsLike}°", tip: "体感温度"),
      WeatherDetailItemViewModel(
          iconPath: "", name: "${wdm.now?.pressure}hPa", tip: "气压"),
      WeatherDetailItemViewModel(
          iconPath: "", name: "${wdm.now?.vis}km", tip: "能见度"),
      WeatherDetailItemViewModel(
          iconPath: "", name: "${wdm.now?.cloud}", tip: "云量"),
    ];
    vm.weather7Daylist = w7m.daily?.map((e) {
      return Weather7DaysItemViewModel(
          dayInWeek: parseWeekDay(
              DateTime.parse(e.fxDate ?? DateTime.now().toString()).weekday),
          date: e.fxDate?.substring(5),
          textDay: e.textDay,
          textNight: e.textNight,
          windDir: e.windDirDay,
          imgDay: findImgByIconNum(e.iconDay),
          imgNight: findImgByIconNum(e.iconNight),
          tempMax: e.tempMax,
          tempMin: e.tempMax);
    }).toList();
    return vm;
  }

  static parseWeekDay(dayInWeek) {
    var l = ['', '周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    return l[dayInWeek];
  }

  static findImgByIconNum(String? iconNum) {
    return Image.asset("asset/qweather/$iconNum.svg");
  }
}

class WeatherDetailItemViewModel {
  String? iconPath;
  String? name;
  String? tip;
  WeatherDetailItemViewModel({this.iconPath, this.name, this.tip});
}

class Weather7DaysItemViewModel {
  String? dayInWeek;
  String? date;
  String? textDay;
  String? textNight;
  Image? imgDay;
  Image? imgNight;
  String? windDir;

  String? tempMax;
  String? tempMin;

  Weather7DaysItemViewModel({
    this.dayInWeek,
    this.date,
    this.textDay,
    this.textNight,
    this.imgDay,
    this.imgNight,
    this.windDir,
    this.tempMax,
    this.tempMin,
  });
}
