import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zk_weather/bloc/top_city/topcity_bloc.dart';
import 'package:zk_weather/common/zk_theme.dart';

import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/view/weather/citys_screen.dart';
import 'package:zk_weather/view/widgets/bottom_nav_bar.dart';

class TapBarScreen extends StatefulWidget {
  TapBarScreen({super.key});

  final tabItemConf = [
    {
      "icon": Icons.home,
      "label": S.current.home,
    },
    {"icon": Icons.search, "label": S.current.search},
    {"icon": Icons.notifications, "label": S.current.notifications},
    {"icon": Icons.local_library_rounded, "label": S.current.library},
  ];

  @override
  State<TapBarScreen> createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> {
  int _index = 0;

  // test() async {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopcityBloc(), //..add(TopcityLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.tabItemConf[_index]["label"] as String? ?? ""),
        ),
        body: IndexedStack(
          index: _index,
          children: [
            const CitysScreen(),
            Center(
              child: Text(S.current.search),
            ),
            Center(
              child: Text(S.current.notifications),
            ),
            Center(
              child: LineChart(LineChartData(backgroundColor: Colors.red)),
            ),
          ],
        ),
        //bottomNavigationBar: navigationBar(),
        bottomNavigationBar: ZKBottomNavBar(
          onTap: (idx) => setState(() {
            _index = idx;
            debugPrint('$idx');
          }),
          items: [
            ...widget.tabItemConf.map(
              (e) => BlurNavbarItem(
                  icon: Icon(e["icon"] as IconData?,
                      color: ZKAppTheme.lightIconColor, size: 24),
                  title: e["label"] as String),
            ),
          ],
          currentIndex: _index,
          selectedColor: Colors.cyanAccent,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.telegram),
          onPressed: () async {
            //Provider.of<CityNowWeatherNotifier>(context, listen: false)
            //.loadShanghaiDataFromApi();
          },
        ),
      ),
    );
  }
}
