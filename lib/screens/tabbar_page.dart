import 'package:flutter/material.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/screens/home/home_page.dart';
import 'package:zk_weather/screens/second/message_page.dart';
import 'package:zk_weather/screens/third/person_page.dart';

class TapBarPage extends StatefulWidget {
  TapBarPage({super.key});

  late var tabItemConf = [
    {"icon": Icons.home_outlined, "label": S.current.home},
    {"icon": Icons.message_outlined, "label": S.current.message},
    {"icon": Icons.person_outlined, "label": S.current.person},
  ];

  @override
  State<TapBarPage> createState() => _TapBarPageState();
}

class _TapBarPageState extends State<TapBarPage> {
  int _index = 0;

  // test() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tabItemConf[_index]["label"] as String? ?? ""),
      ),
      body: IndexedStack(
        index: _index,
        children: const [
          Homepage(),
          MessagePage(),
          PersonPage(),
        ],
      ),
      bottomNavigationBar: navigationBar(),
    );
  }

  void onBottomNavBarTap(index) {
    setState(() {
      _index = index;
    });
  }

  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      items: [
        ...widget.tabItemConf.map((e) => BottomNavigationBarItem(
            icon: Icon(
              e["icon"] as IconData? ?? Icons.question_answer_outlined,
            ),
            label: e["label"] as String? ?? ""))
      ]

      // [
      //   BottomNavigationBarItem(
      //       icon: const Icon(Icons.home), label: S.current.home),
      //   BottomNavigationBarItem(
      //       icon: const Icon(Icons.message), label: S.current.message),
      //   BottomNavigationBarItem(
      //       icon: const Icon(Icons.person), label: S.current.person),
      // ],
      ,
      onTap: onBottomNavBarTap,
    );
  }
}
