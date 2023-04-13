import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:zk_weather/common/zk_theme.dart';
import 'package:zk_weather/model/weather_now_model.dart';

class CityWeatherListItem extends StatelessWidget {
  CityWeatherListItem({super.key, required this.model});
  WeatherNowModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 5, 18, 0),
      child: Card(
        clipBehavior: Clip.antiAlias, //抗锯齿
        elevation: 5, //阴影大小
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))), //圆角
        //margin: const EdgeInsets.all(18), //外边距
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '北京市',
                      style: ZKAppTheme.largeTextStyle,
                    ),
                    Text(
                      formatDate(DateTime.now(), [HH, ':', nn]),
                      style: ZKAppTheme.smallTextStyle,
                    ),
                  ],
                ),
                Text(
                  '${model.main.temp}°',
                  style: ZKAppTheme.largeTextStyle.copyWith(fontSize: 40),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.weather[0].description,
                  style: ZKAppTheme.smallTextStyle,
                ),
                Text(
                  '最高${model.main.tempMax}° 最低${model.main.tempMin}°',
                  style: ZKAppTheme.smallTextStyle,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
