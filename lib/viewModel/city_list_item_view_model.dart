import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/model/top_citys/top_city.dart';
import 'package:zk_weather/model/weather_now/weather.dart';
import 'package:zk_weather/model/weather_now/weather_now_model.dart';

class CityListItemViewModel {
  late WeatherNowModel weatherNowModel;
  late TopCityModel topCityModel;
  String? cityName;
  String? areaName;
  String? temp;
  String? maxTemp;
  String? minTemp;
  String? description;

  CityListItemViewModel(
      {required this.weatherNowModel, required this.topCityModel}) {
    cityName = "${topCityModel.adm2}${S.current.word_city}";
    areaName = topCityModel.name;
    double dtemp = weatherNowModel.main?.temp ?? 0;
    double dmaxTemp = weatherNowModel.main?.tempMax ?? 0;
    double dminTemp = weatherNowModel.main?.tempMin ?? 0;
    temp = dtemp.toStringAsFixed(0);
    maxTemp = dmaxTemp.toStringAsFixed(0);
    minTemp = dminTemp.toStringAsFixed(0);
    List<Weather> wl = weatherNowModel.weather ?? [];
    if (wl.isNotEmpty) {
      description = wl[0].description;
    }
  }
}
