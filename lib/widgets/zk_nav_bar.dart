import 'package:flutter/material.dart';
import 'package:zk_weather/generated/l10n.dart';

class ZkBottomNavBar extends BottomNavigationBar {
  ZkBottomNavBar({super.key})
      : super(items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: S.current.home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.message), label: S.current.message),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: S.current.person),
        ]);
}
