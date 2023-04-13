import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zk_weather/states/city_now_weather_notifier.dart';
import 'package:zk_weather/widgets/city_weather_list_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CityNowWeatherNotifier(),
      child: Consumer(
        builder: (context, value, child) => ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const CityWeatherListItem(),
        ),
      ),
    );
  }
}
