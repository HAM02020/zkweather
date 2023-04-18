class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200(
      Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic>
      toCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}
