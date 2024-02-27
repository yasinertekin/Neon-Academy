import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final class CounterViewModel extends ChangeNotifier {
  CounterViewModel();

  int _counter = 0;
  Timer? _timer;

  int get counter => _counter;

  void startAutoIncrement() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (_counter < 100) {
          incrementCounter();
        } else {
          // Sayaç 100'e ulaştığında zamanlayıcıyı durdur
          _timer?.cancel();
        }
      },
    );
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Zamanlayıcıyı dispose et
    super.dispose();
  }
}
