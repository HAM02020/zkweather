import 'package:zk_weather/utils/network/zk_network_manager.dart';
import 'package:intl/intl.dart';

class Api {
  static String openweatherBaseUrl =
      "https://api.openweathermap.org"; //openweather接口
  static String qweatherBaseUrl = "https://devapi.qweather.com"; //和风天气接口
  static String qgeoWeatherBaseUrl = "https://geoapi.qweather.com"; //和风天气geo接口

  static String open_appid = "75dfb35b75926584872275e6f26dce6a";
  static String qweather_apikey = "2ae39f310d02468f89b017fa9d98f3ab";

  static Future<dynamic> topCitys() async {
    var response = await ZKNetworkManager()
        .doGet('$qgeoWeatherBaseUrl/v2/city/top', queryParameters: {
      "key": qweather_apikey,
      "range": 'cn',
      "number": 5,
      "lang": Intl.getCurrentLocale().substring(0, 2),
    });
    return response.data;
  }

  static Future<dynamic> cityWeather({lon, lat}) async {
    var response = await ZKNetworkManager()
        .doGet('$openweatherBaseUrl/data/2.5/weather', queryParameters: {
      "appid": open_appid,
      "lon": lon ?? "116.20",
      "lat": lat ?? "39.56",
      "lang": Intl.getCurrentLocale(),
      "units": "metric"
    });
    return response.data;
  }
}
