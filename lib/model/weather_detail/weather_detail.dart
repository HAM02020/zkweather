class WeatherDetail {
  String? code;
  String? updateTime;
  String? fxLink;
  Now? now;

  WeatherDetail({
    this.code,
    this.updateTime,
    this.fxLink,
    this.now,
  });

  factory WeatherDetail.fromJson(Map<String, dynamic> json) {
    return WeatherDetail(
      code: json['code'] as String?,
      updateTime: json['updateTime'] as String?,
      fxLink: json['fxLink'] as String?,
      now: json['now'] == null
          ? null
          : Now
              .fromCode200UpdateTime20230417T15420800FxLinkHttpsWwwQweatherComWeatherBeijing101010100HtmlNowObsTime20230417T15360800Temp21FeelsLike17Icon101TextWind360143WindDirWindScale3WindSpeed17Humidity33Precip00Pressure1001Vis12Cloud91Dew3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40(
                  json['now'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic>
      toCode200UpdateTime20230417T15420800FxLinkHttpsWwwQweatherComWeatherBeijing101010100HtmlNowObsTime20230417T15360800Temp21FeelsLike17Icon101TextWind360143WindDirWindScale3WindSpeed17Humidity33Precip00Pressure1001Vis12Cloud91Dew3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40() {
    return {
      'code': code,
      'updateTime': updateTime,
      'fxLink': fxLink,
      'now': now
          ?.toCode200UpdateTime20230417T15420800FxLinkHttpsWwwQweatherComWeatherBeijing101010100HtmlNowObsTime20230417T15360800Temp21FeelsLike17Icon101TextWind360143WindDirWindScale3WindSpeed17Humidity33Precip00Pressure1001Vis12Cloud91Dew3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40(),
    };
  }
}

class Now {
  String? obsTime;
  String? temp;
  String? feelsLike;
  String? icon;
  String? text;
  String? wind360;
  String? windDir;
  String? windScale;
  String? windSpeed;
  String? humidity;
  String? precip;
  String? pressure;
  String? vis;
  String? cloud;
  String? dew;

  Now({
    this.obsTime,
    this.temp,
    this.feelsLike,
    this.icon,
    this.text,
    this.wind360,
    this.windDir,
    this.windScale,
    this.windSpeed,
    this.humidity,
    this.precip,
    this.pressure,
    this.vis,
    this.cloud,
    this.dew,
  });

  factory Now.fromCode200UpdateTime20230417T15420800FxLinkHttpsWwwQweatherComWeatherBeijing101010100HtmlNowObsTime20230417T15360800Temp21FeelsLike17Icon101TextWind360143WindDirWindScale3WindSpeed17Humidity33Precip00Pressure1001Vis12Cloud91Dew3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40(
      Map<String, dynamic> json) {
    return Now(
      obsTime: json['obsTime'] as String?,
      temp: json['temp'] as String?,
      feelsLike: json['feelsLike'] as String?,
      icon: json['icon'] as String?,
      text: json['text'] as String?,
      wind360: json['wind360'] as String?,
      windDir: json['windDir'] as String?,
      windScale: json['windScale'] as String?,
      windSpeed: json['windSpeed'] as String?,
      humidity: json['humidity'] as String?,
      precip: json['precip'] as String?,
      pressure: json['pressure'] as String?,
      vis: json['vis'] as String?,
      cloud: json['cloud'] as String?,
      dew: json['dew'] as String?,
    );
  }

  Map<String, dynamic>
      toCode200UpdateTime20230417T15420800FxLinkHttpsWwwQweatherComWeatherBeijing101010100HtmlNowObsTime20230417T15360800Temp21FeelsLike17Icon101TextWind360143WindDirWindScale3WindSpeed17Humidity33Precip00Pressure1001Vis12Cloud91Dew3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40() {
    return {
      'obsTime': obsTime,
      'temp': temp,
      'feelsLike': feelsLike,
      'icon': icon,
      'text': text,
      'wind360': wind360,
      'windDir': windDir,
      'windScale': windScale,
      'windSpeed': windSpeed,
      'humidity': humidity,
      'precip': precip,
      'pressure': pressure,
      'vis': vis,
      'cloud': cloud,
      'dew': dew,
    };
  }
}
