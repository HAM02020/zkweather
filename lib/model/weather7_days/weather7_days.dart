class Weather7Days {
  String? code;
  String? updateTime;
  String? fxLink;
  List<Daily>? daily;

  Weather7Days({
    this.code,
    this.updateTime,
    this.fxLink,
    this.daily,
  });

  factory Weather7Days.fromJson(Map<String, dynamic> json) {
    return Weather7Days(
      code: json['code'] as String?,
      updateTime: json['updateTime'] as String?,
      fxLink: json['fxLink'] as String?,
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => Daily
              .fromCode200UpdateTime20230417T15350800FxLinkHttpsWwwQweatherComWeatherDongcheng101011600HtmlDailyFxDate20230417Sunrise0534Sunset1855Moonrise0419Moonset1548MoonPhaseMoonPhaseIcon807TempMax22TempMin10IconDay101TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity51Precip00Pressure1005Vis25Cloud25UvIndex8FxDate20230418Sunrise0533Sunset1856Moonrise0445Moonset1700MoonPhaseMoonPhaseIcon807TempMax27TempMin9IconDay100TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night180WindDirNightWindScaleNight12WindSpeedNight3Humidity57Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230419Sunrise0531Sunset1857Moonrise0509Moonset1810MoonPhaseMoonPhaseIcon807TempMax26TempMin14IconDay100TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight34WindSpeedNight24Humidity32Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230420Sunrise0530Sunset1858Moonrise0535Moonset1920MoonPhaseMoonPhaseIcon800TempMax20TempMin11IconDay101TextDayIconNight151TextNightWind360Day0WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity23Precip00Pressure1018Vis25Cloud25UvIndex2FxDate20230421Sunrise0528Sunset1859Moonrise0601Moonset2030MoonPhaseMoonPhaseIcon801TempMax19TempMin9IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay34WindSpeedDay16Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity55Precip00Pressure1015Vis25Cloud25UvIndex3FxDate20230422Sunrise0527Sunset1900Moonrise0632Moonset2139MoonPhaseMoonPhaseIcon801TempMax18TempMin7IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity61Precip00Pressure1019Vis25Cloud25UvIndex2FxDate20230423Sunrise0525Sunset1901Moonrise0706Moonset2245MoonPhaseMoonPhaseIcon801TempMax21TempMin10IconDay101TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity28Precip00Pressure1020Vis25Cloud25UvIndex3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic>
      toCode200UpdateTime20230417T15350800FxLinkHttpsWwwQweatherComWeatherDongcheng101011600HtmlDailyFxDate20230417Sunrise0534Sunset1855Moonrise0419Moonset1548MoonPhaseMoonPhaseIcon807TempMax22TempMin10IconDay101TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity51Precip00Pressure1005Vis25Cloud25UvIndex8FxDate20230418Sunrise0533Sunset1856Moonrise0445Moonset1700MoonPhaseMoonPhaseIcon807TempMax27TempMin9IconDay100TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night180WindDirNightWindScaleNight12WindSpeedNight3Humidity57Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230419Sunrise0531Sunset1857Moonrise0509Moonset1810MoonPhaseMoonPhaseIcon807TempMax26TempMin14IconDay100TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight34WindSpeedNight24Humidity32Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230420Sunrise0530Sunset1858Moonrise0535Moonset1920MoonPhaseMoonPhaseIcon800TempMax20TempMin11IconDay101TextDayIconNight151TextNightWind360Day0WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity23Precip00Pressure1018Vis25Cloud25UvIndex2FxDate20230421Sunrise0528Sunset1859Moonrise0601Moonset2030MoonPhaseMoonPhaseIcon801TempMax19TempMin9IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay34WindSpeedDay16Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity55Precip00Pressure1015Vis25Cloud25UvIndex3FxDate20230422Sunrise0527Sunset1900Moonrise0632Moonset2139MoonPhaseMoonPhaseIcon801TempMax18TempMin7IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity61Precip00Pressure1019Vis25Cloud25UvIndex2FxDate20230423Sunrise0525Sunset1901Moonrise0706Moonset2245MoonPhaseMoonPhaseIcon801TempMax21TempMin10IconDay101TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity28Precip00Pressure1020Vis25Cloud25UvIndex3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40() {
    return {
      'code': code,
      'updateTime': updateTime,
      'fxLink': fxLink,
      'daily': daily
          ?.map((e) => e
              .toCode200UpdateTime20230417T15350800FxLinkHttpsWwwQweatherComWeatherDongcheng101011600HtmlDailyFxDate20230417Sunrise0534Sunset1855Moonrise0419Moonset1548MoonPhaseMoonPhaseIcon807TempMax22TempMin10IconDay101TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity51Precip00Pressure1005Vis25Cloud25UvIndex8FxDate20230418Sunrise0533Sunset1856Moonrise0445Moonset1700MoonPhaseMoonPhaseIcon807TempMax27TempMin9IconDay100TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night180WindDirNightWindScaleNight12WindSpeedNight3Humidity57Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230419Sunrise0531Sunset1857Moonrise0509Moonset1810MoonPhaseMoonPhaseIcon807TempMax26TempMin14IconDay100TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight34WindSpeedNight24Humidity32Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230420Sunrise0530Sunset1858Moonrise0535Moonset1920MoonPhaseMoonPhaseIcon800TempMax20TempMin11IconDay101TextDayIconNight151TextNightWind360Day0WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity23Precip00Pressure1018Vis25Cloud25UvIndex2FxDate20230421Sunrise0528Sunset1859Moonrise0601Moonset2030MoonPhaseMoonPhaseIcon801TempMax19TempMin9IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay34WindSpeedDay16Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity55Precip00Pressure1015Vis25Cloud25UvIndex3FxDate20230422Sunrise0527Sunset1900Moonrise0632Moonset2139MoonPhaseMoonPhaseIcon801TempMax18TempMin7IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity61Precip00Pressure1019Vis25Cloud25UvIndex2FxDate20230423Sunrise0525Sunset1901Moonrise0706Moonset2245MoonPhaseMoonPhaseIcon801TempMax21TempMin10IconDay101TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity28Precip00Pressure1020Vis25Cloud25UvIndex3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40())
          .toList(),
    };
  }
}

class Daily {
  String? fxDate;
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonPhaseIcon;
  String? tempMax;
  String? tempMin;
  String? iconDay;
  String? textDay;
  String? iconNight;
  String? textNight;
  String? wind360Day;
  String? windDirDay;
  String? windScaleDay;
  String? windSpeedDay;
  String? wind360Night;
  String? windDirNight;
  String? windScaleNight;
  String? windSpeedNight;
  String? humidity;
  String? precip;
  String? pressure;
  String? vis;
  String? cloud;
  String? uvIndex;

  Daily({
    this.fxDate,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonPhaseIcon,
    this.tempMax,
    this.tempMin,
    this.iconDay,
    this.textDay,
    this.iconNight,
    this.textNight,
    this.wind360Day,
    this.windDirDay,
    this.windScaleDay,
    this.windSpeedDay,
    this.wind360Night,
    this.windDirNight,
    this.windScaleNight,
    this.windSpeedNight,
    this.humidity,
    this.precip,
    this.pressure,
    this.vis,
    this.cloud,
    this.uvIndex,
  });

  factory Daily.fromCode200UpdateTime20230417T15350800FxLinkHttpsWwwQweatherComWeatherDongcheng101011600HtmlDailyFxDate20230417Sunrise0534Sunset1855Moonrise0419Moonset1548MoonPhaseMoonPhaseIcon807TempMax22TempMin10IconDay101TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity51Precip00Pressure1005Vis25Cloud25UvIndex8FxDate20230418Sunrise0533Sunset1856Moonrise0445Moonset1700MoonPhaseMoonPhaseIcon807TempMax27TempMin9IconDay100TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night180WindDirNightWindScaleNight12WindSpeedNight3Humidity57Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230419Sunrise0531Sunset1857Moonrise0509Moonset1810MoonPhaseMoonPhaseIcon807TempMax26TempMin14IconDay100TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight34WindSpeedNight24Humidity32Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230420Sunrise0530Sunset1858Moonrise0535Moonset1920MoonPhaseMoonPhaseIcon800TempMax20TempMin11IconDay101TextDayIconNight151TextNightWind360Day0WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity23Precip00Pressure1018Vis25Cloud25UvIndex2FxDate20230421Sunrise0528Sunset1859Moonrise0601Moonset2030MoonPhaseMoonPhaseIcon801TempMax19TempMin9IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay34WindSpeedDay16Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity55Precip00Pressure1015Vis25Cloud25UvIndex3FxDate20230422Sunrise0527Sunset1900Moonrise0632Moonset2139MoonPhaseMoonPhaseIcon801TempMax18TempMin7IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity61Precip00Pressure1019Vis25Cloud25UvIndex2FxDate20230423Sunrise0525Sunset1901Moonrise0706Moonset2245MoonPhaseMoonPhaseIcon801TempMax21TempMin10IconDay101TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity28Precip00Pressure1020Vis25Cloud25UvIndex3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40(
      Map<String, dynamic> json) {
    return Daily(
      fxDate: json['fxDate'] as String?,
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moonPhase: json['moonPhase'] as String?,
      moonPhaseIcon: json['moonPhaseIcon'] as String?,
      tempMax: json['tempMax'] as String?,
      tempMin: json['tempMin'] as String?,
      iconDay: json['iconDay'] as String?,
      textDay: json['textDay'] as String?,
      iconNight: json['iconNight'] as String?,
      textNight: json['textNight'] as String?,
      wind360Day: json['wind360Day'] as String?,
      windDirDay: json['windDirDay'] as String?,
      windScaleDay: json['windScaleDay'] as String?,
      windSpeedDay: json['windSpeedDay'] as String?,
      wind360Night: json['wind360Night'] as String?,
      windDirNight: json['windDirNight'] as String?,
      windScaleNight: json['windScaleNight'] as String?,
      windSpeedNight: json['windSpeedNight'] as String?,
      humidity: json['humidity'] as String?,
      precip: json['precip'] as String?,
      pressure: json['pressure'] as String?,
      vis: json['vis'] as String?,
      cloud: json['cloud'] as String?,
      uvIndex: json['uvIndex'] as String?,
    );
  }

  Map<String, dynamic>
      toCode200UpdateTime20230417T15350800FxLinkHttpsWwwQweatherComWeatherDongcheng101011600HtmlDailyFxDate20230417Sunrise0534Sunset1855Moonrise0419Moonset1548MoonPhaseMoonPhaseIcon807TempMax22TempMin10IconDay101TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity51Precip00Pressure1005Vis25Cloud25UvIndex8FxDate20230418Sunrise0533Sunset1856Moonrise0445Moonset1700MoonPhaseMoonPhaseIcon807TempMax27TempMin9IconDay100TextDayIconNight150TextNightWind360Day135WindDirDayWindScaleDay12WindSpeedDay3Wind360Night180WindDirNightWindScaleNight12WindSpeedNight3Humidity57Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230419Sunrise0531Sunset1857Moonrise0509Moonset1810MoonPhaseMoonPhaseIcon807TempMax26TempMin14IconDay100TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight34WindSpeedNight24Humidity32Precip00Pressure1004Vis25Cloud25UvIndex8FxDate20230420Sunrise0530Sunset1858Moonrise0535Moonset1920MoonPhaseMoonPhaseIcon800TempMax20TempMin11IconDay101TextDayIconNight151TextNightWind360Day0WindDirDayWindScaleDay34WindSpeedDay16Wind360Night0WindDirNightWindScaleNight12WindSpeedNight3Humidity23Precip00Pressure1018Vis25Cloud25UvIndex2FxDate20230421Sunrise0528Sunset1859Moonrise0601Moonset2030MoonPhaseMoonPhaseIcon801TempMax19TempMin9IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay34WindSpeedDay16Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity55Precip00Pressure1015Vis25Cloud25UvIndex3FxDate20230422Sunrise0527Sunset1900Moonrise0632Moonset2139MoonPhaseMoonPhaseIcon801TempMax18TempMin7IconDay101TextDayIconNight151TextNightWind360Day225WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity61Precip00Pressure1019Vis25Cloud25UvIndex2FxDate20230423Sunrise0525Sunset1901Moonrise0706Moonset2245MoonPhaseMoonPhaseIcon801TempMax21TempMin10IconDay101TextDayIconNight151TextNightWind360Day180WindDirDayWindScaleDay12WindSpeedDay3Wind360Night225WindDirNightWindScaleNight12WindSpeedNight3Humidity28Precip00Pressure1020Vis25Cloud25UvIndex3ReferSourcesQWeatherNmcEcmwfLicenseCcBySa40() {
    return {
      'fxDate': fxDate,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moonPhase': moonPhase,
      'moonPhaseIcon': moonPhaseIcon,
      'tempMax': tempMax,
      'tempMin': tempMin,
      'iconDay': iconDay,
      'textDay': textDay,
      'iconNight': iconNight,
      'textNight': textNight,
      'wind360Day': wind360Day,
      'windDirDay': windDirDay,
      'windScaleDay': windScaleDay,
      'windSpeedDay': windSpeedDay,
      'wind360Night': wind360Night,
      'windDirNight': windDirNight,
      'windScaleNight': windScaleNight,
      'windSpeedNight': windSpeedNight,
      'humidity': humidity,
      'precip': precip,
      'pressure': pressure,
      'vis': vis,
      'cloud': cloud,
      'uvIndex': uvIndex,
    };
  }
}
