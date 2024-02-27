import 'package:custom_circular/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

final class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterViewModel = CounterViewModel();
    return ListenableBuilder(
      listenable: counterViewModel,
      builder: (context, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: counterViewModel.startAutoIncrement,
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
                        color: counterViewModel.counter % 10 == 0
                            ? context.general.randomColor
                            : Colors.blue,
                      )
                    else
                      const SizedBox.shrink(),
                    Text('Sayaç: ${counterViewModel.counter}'),
                    if (counterViewModel.counter == 100)
                      const Text("Sayaç 100'e ulaştı"),
                  ],
                )
              else
                const Text(
                  'Otomatik artışı başlatmak için artı simgesine tıkla',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
