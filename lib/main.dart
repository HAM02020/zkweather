import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zk_weather/bloc/calc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider(
              create: (context) => CalcCubit(),
              child: const CounterPage(),
            )
      },
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CalcCubit, int>(
          builder: (context, count) => Center(
                child: Text('$count'),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CalcCubit>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
