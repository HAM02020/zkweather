import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zk_weather/common/zk_theme.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/view/tabbar_screen.dart';
import 'package:zk_weather/view/weather/detail/weather_detail_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ScreenUtil.init(context);
        return WeatherDetailScreen();
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ZKAppTheme.lightTheme,
      darkTheme: ZKAppTheme.darkTheme,
      initialRoute: "detail",
      routes: {
        "/": (context) => TapBarScreen(),
        "detail": (context) => WeatherDetailScreen()
      },
    );
  }
}
