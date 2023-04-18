class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200(
      Map<String, dynamic> json) {
    return Main(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      seaLevel: json['sea_level'] as int?,
      grndLevel: json['grnd_level'] as int?,
    );
  }

  Map<String, dynamic>
      toCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
    };
  }
}
