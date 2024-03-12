import 'dart:math';

import 'package:custom_circular/counter_view_model.dart';
import 'package:flutter/material.dart';

final random = Random();

extension BuildContextExtensions on BuildContext {
  Color get randomColor {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}

final class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterViewModel = CounterViewModel();

    return ListenableBuilder(
      listenable: counterViewModel,
      builder: (context, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterViewModel.startAutoIncrement(context);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (counterViewModel.counter > 0)
                Column(
                  children: [
                    if (counterViewModel.counter < 100)
                      CircularProgressIndicator(
                        color: counterViewModel.currentColor,
                      )
                    else
                      const SizedBox.shrink(),
                    Text('Counter: ${counterViewModel.counter}'),
                    if (counterViewModel.counter == 100)
                      const Text('Counter reached 100'),
                  ],
                )
              else
                const Text(
                  'Click the plus icon to start automatic increment',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
