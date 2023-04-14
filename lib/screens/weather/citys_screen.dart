import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zk_weather/bloc/city_weather/city_weather_bloc.dart';
import 'package:zk_weather/bloc/top_city/topcity_bloc.dart';
import 'package:zk_weather/screens/weather/detail/weather_detail_screen.dart';
import 'package:zk_weather/widgets/city_weather_list_item.dart';

class CitysScreen extends StatelessWidget {
  const CitysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CityWeatherBloc(topcityBloc: BlocProvider.of<TopcityBloc>(context)),
      child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WeatherDetailScreen()),
                );
              },
              child: CityWeatherListItem(
                viewModel: state.list[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
