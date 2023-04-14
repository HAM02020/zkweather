import 'package:flutter/material.dart';
import 'package:zk_weather/common/zk_theme.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/viewModel/city_list_item_view_model.dart';

class CityWeatherListItem extends StatelessWidget {
  CityWeatherListItem({super.key, required this.viewModel});
  CityListItemViewModel viewModel;

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
                    Text(
                      '${viewModel.cityName}',
                      style: ZKAppTheme.largeTextStyle,
                    ),
                    Text(
                      '${viewModel.areaName}',
                      style: ZKAppTheme.smallTextStyle,
                    ),
                  ],
                ),
                Text(
                  '${viewModel.temp}°',
                  style: ZKAppTheme.largeTextStyle.copyWith(fontSize: 60),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  viewModel.description ?? '暂无描述',
                  style: ZKAppTheme.smallTextStyle,
                ),
                Text(
                  '${S.current.high}${viewModel.maxTemp}° ${S.current.low}${viewModel.minTemp}°',
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
