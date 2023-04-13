import 'package:flutter/material.dart';

class MyChangeNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
    notifyListeners();
  }
}
