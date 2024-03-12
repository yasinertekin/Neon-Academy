import 'dart:async';

import 'package:custom_circular/counter_view.dart';
import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 0;
  Color _currentColor = Colors.blue;
  Timer? _timer;

  int get counter => _counter;
  Color get currentColor => _currentColor;

  void startAutoIncrement(BuildContext context) {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (_counter < 100) {
          incrementCounter(context);
        } else {
          _timer?.cancel();
        }
      },
    );
    notifyListeners();
  }

  void incrementCounter(BuildContext context) {
    _counter++;
    if (_counter % 10 == 0 && _counter <= 100) {
      _currentColor = context.randomColor;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
