import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zk_weather/generated/l10n.dart';

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
  String? cityName;
  String? temp;
  String? text;
  Widget? bigPic;
  Map<String, String> dateMap = {};
  List<WeatherDetailItemViewModel>? detailItemList;
  List<Weather7DaysItemViewModel>? weather7DayItemlist;
  List<double>? tempMaxList;
  List<double>? tempMinList;

  WeatherDetialViewModel._init();
  static FutureOr<WeatherDetialViewModel> load({cityName, location}) async {
    WeatherDetialViewModel vm = WeatherDetialViewModel._init();
    vm.cityName = cityName;

    var jsonDetail = await Api.weatherDetail(location);
    var json7Days = await Api.weather7Days(location);
    var wdm = WeatherDetail.fromJson(jsonDetail);
    var w7m = Weather7Days.fromJson(json7Days);
    vm.temp = wdm.now?.temp;
    vm.text = wdm.now?.text;
    w7m.daily?.forEach((e) {
      var date = e.fxDate?.substring(5) ?? "";
      var weekday = parseWeekDay(
          DateTime.parse(e.fxDate ?? DateTime.now().toString()).weekday);
      vm.dateMap[date] = weekday;
    });

    vm.detailItemList = [
      WeatherDetailItemViewModel(
          iconPath: "asset/icons/fengsu.svg",
          name: "${wdm.now?.windScale}级",
          tip: "${wdm.now?.windDir}"),
      WeatherDetailItemViewModel(
          iconPath: "asset/icons/ziyuan.svg",
          name: "${wdm.now?.humidity}%",
          tip: "湿度"),
      WeatherDetailItemViewModel(
          iconPath: "asset/icons/kongqiwendu.svg",
          name: "${wdm.now?.feelsLike}°",
          tip: "体感温度"),
      WeatherDetailItemViewModel(
          iconPath: "asset/icons/qiya.svg",
          name: "${wdm.now?.pressure}hPa",
          tip: "气压"),
      WeatherDetailItemViewModel(
          iconPath: "asset/icons/yanjing.svg",
          name: "${wdm.now?.vis}km",
          tip: "能见度"),
      WeatherDetailItemViewModel(
          iconPath: "asset/icons/yun.svg",
          name: "${wdm.now?.cloud}",
          tip: "云量"),
    ];
    vm.weather7DayItemlist = w7m.daily?.map((e) {
      return Weather7DaysItemViewModel(
          dayInWeek: parseWeekDay(
              DateTime.parse(e.fxDate ?? DateTime.now().toString()).weekday),
          date: e.fxDate?.substring(5),
          textDay: e.textDay,
          textNight: e.textNight,
          windDir: "${e.windDirDay}${e.windScaleDay}${S.current.windScale}",
          imgDay: findImgByIconNum(e.iconDay),
          imgNight: findImgByIconNum(e.iconNight),
          tempMax: "${e.tempMax}°",
          tempMin: "${e.tempMin}°");
    }).toList();
    vm.tempMaxList = w7m.daily
        ?.map((e) => double.parse(e.tempMax ?? '0'))
        .cast<double>()
        .toList();
    vm.tempMinList = w7m.daily
        ?.map((e) => double.parse(e.tempMin ?? '0'))
        .cast<double>()
        .toList();
    return vm;
  }

  static parseWeekDay(dayInWeek) {
    var l = ['', '周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    return l[dayInWeek];
  }

  static findImgByIconNum(String? iconNum) {
    return SvgPicture.asset(
      "asset/qweather/$iconNum.svg",
      width: 22.r,
    );
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
  Widget? imgDay;
  Widget? imgNight;
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
