class Clouds {
  int? all;

  Clouds({this.all});

  factory Clouds.fromCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200(
      Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] as int?,
    );
  }

  Map<String, dynamic>
      toCoordLon1162Lat3956WeatherId804MainCloudsDescriptionIcon04dBaseStationsMainTemp2779FeelsLike2653TempMin2779TempMax2779Pressure1004Humidity17SeaLevel1004GrndLevel1000Visibility10000WindSpeed37Deg211Gust517CloudsAll100Dt1681372488SysCountryCnSunrise1681335710Sunset1681382972Timezone28800Id1912147NameYuzhuangCod200() {
    return {
      'all': all,
    };
  }
}
