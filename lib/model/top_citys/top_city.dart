class TopCityModel {
  String? name;
  String? id;
  String? lat;
  String? lon;
  String? adm2;
  String? adm1;
  String? country;
  String? tz;
  String? utcOffset;
  String? isDst;
  String? type;
  String? rank;
  String? fxLink;

  TopCityModel({
    this.name,
    this.id,
    this.lat,
    this.lon,
    this.adm2,
    this.adm1,
    this.country,
    this.tz,
    this.utcOffset,
    this.isDst,
    this.type,
    this.rank,
    this.fxLink,
  });

  factory TopCityModel.fromCode200TopCityListNameId101210106Lat3027371Lon11997874Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank25FxLinkHttpsWwwQweatherComWeatherYuhang101210106HtmlNameId101010100Lat3990499Lon11640529Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank10FxLinkHttpsWwwQweatherComWeatherBeijing101010100HtmlNameId101010300Lat3992149Lon11648641Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank15FxLinkHttpsWwwQweatherComWeatherChaoyang101010300HtmlNameId101020500Lat3138352Lon12125034Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank23FxLinkHttpsWwwQweatherComWeatherJiading101020500HtmlNameId101010200Lat3995607Lon11631032Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank15FxLinkHttpsWwwQweatherComWeatherHaidian101010200HtmlReferSourcesQWeatherLicenseQWeatherDevelopersLicense(
      Map<String, dynamic> json) {
    return TopCityModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      adm2: json['adm2'] as String?,
      adm1: json['adm1'] as String?,
      country: json['country'] as String?,
      tz: json['tz'] as String?,
      utcOffset: json['utcOffset'] as String?,
      isDst: json['isDst'] as String?,
      type: json['type'] as String?,
      rank: json['rank'] as String?,
      fxLink: json['fxLink'] as String?,
    );
  }

  Map<String, dynamic>
      toCode200TopCityListNameId101210106Lat3027371Lon11997874Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank25FxLinkHttpsWwwQweatherComWeatherYuhang101210106HtmlNameId101010100Lat3990499Lon11640529Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank10FxLinkHttpsWwwQweatherComWeatherBeijing101010100HtmlNameId101010300Lat3992149Lon11648641Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank15FxLinkHttpsWwwQweatherComWeatherChaoyang101010300HtmlNameId101020500Lat3138352Lon12125034Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank23FxLinkHttpsWwwQweatherComWeatherJiading101020500HtmlNameId101010200Lat3995607Lon11631032Adm2Adm1CountryTzAsiaShanghaiUtcOffset0800IsDst0TypeCityRank15FxLinkHttpsWwwQweatherComWeatherHaidian101010200HtmlReferSourcesQWeatherLicenseQWeatherDevelopersLicense() {
    return {
      'name': name,
      'id': id,
      'lat': lat,
      'lon': lon,
      'adm2': adm2,
      'adm1': adm1,
      'country': country,
      'tz': tz,
      'utcOffset': utcOffset,
      'isDst': isDst,
      'type': type,
      'rank': rank,
      'fxLink': fxLink,
    };
  }
}
