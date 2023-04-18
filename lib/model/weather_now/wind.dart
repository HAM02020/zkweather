class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200(
      Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: json['deg'] as int?,
      gust: (json['gust'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic>
      toCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }
}
