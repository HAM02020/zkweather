import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zk_weather/bloc/city_weather/city_weather_bloc.dart';
import 'package:zk_weather/bloc/top_city/topcity_bloc.dart';
import 'package:zk_weather/bloc/weather_detail/weather_detail_bloc.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/view/weather/detail/weather_detail_screen.dart';
import 'package:zk_weather/view/widgets/city_weather_list_item.dart';

class CitysScreen extends StatelessWidget {
  const CitysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CityWeatherBloc(topcityBloc: BlocProvider.of<TopcityBloc>(context)),
      child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
        builder: (context, state) {
          var topCityBloc = BlocProvider.of<TopcityBloc>(context);
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (mctx) => BlocProvider(
                            create: (ctx) => WeatherDetailBloc(
                                topcityBloc: topCityBloc,
                                cityWeatherBloc:
                                    BlocProvider.of<CityWeatherBloc>(context))
                              ..add(WeatherDetailShouldLoadEvent(
                                index: index,
                              )),
                            child: WeatherDetailScreen(
                              initialPage: index,
                            ),
                          )),
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
