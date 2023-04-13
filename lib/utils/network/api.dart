import 'package:zk_weather/utils/network/zk_network_manager.dart';
import 'package:intl/intl.dart';

class Api {
  static String openWeatherBaseUrl = "https://api.openweathermap.org";
  static String openappid = "75dfb35b75926584872275e6f26dce6a";
  static cityWeather({lon, lat}) async {
    var response = await ZKNetworkManager()
        .doGet('$openWeatherBaseUrl/data/2.5/weather', queryParameters: {
      "appid": openappid,
      "lon": lon ?? "116.20",
      "lat": lat ?? "39.56",
      "lang": Intl.getCurrentLocale(),
      "units": "metric"
    });
    return response.data;
  }
}
