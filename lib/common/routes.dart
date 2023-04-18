import 'package:flutter/material.dart';
import 'package:zk_weather/view/tabbar_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  String routeName;
  routeName = settings.name!;
  switch (routeName) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => TapBarScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => TapBarScreen(),
      );
  }
}
