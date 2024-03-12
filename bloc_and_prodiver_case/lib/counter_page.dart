import 'package:bloc_and_prodiver_case/provider/counter_provider.dart';
import 'package:bloc_and_prodiver_case/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/counter_bloc.dart';

final class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CounterBlocView();
  }
}

final class _CounterBlocView extends StatelessWidget {
  const _CounterBlocView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  '$state Bloc Counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Consumer<CounterProvider>(
              builder: (context, value, child) => Text(
                '${value.counter} Provider Counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementPressed());
              },
              child: const Text('Increment by Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: const Text('Increment by Bloc'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: const Text('Go to Second Page'),
            )
          ],
        ),
      ),
    );
  }
}
