import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zk_weather/providers/city_now_weather_notifier.dart';
import 'package:zk_weather/widgets/city_weather_list_item.dart';

class CitysScreen extends StatefulWidget {
  const CitysScreen({super.key});

  @override
  State<CitysScreen> createState() => _CitysScreenState();
}

class _CitysScreenState extends State<CitysScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CityNowWeatherNotifier>(context, listen: false)
        .loadDataFromApi();

    return Consumer<CityNowWeatherNotifier>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.cityWeatherList.length,
        itemBuilder: (context, index) => CityWeatherListItem(
          model: value.cityWeatherList[index],
        ),
      ),
    );
  }
}
