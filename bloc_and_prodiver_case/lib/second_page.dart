import 'package:bloc_and_prodiver_case/bloc/counter_bloc.dart';
import 'package:bloc_and_prodiver_case/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectBlocState = context.select((CounterBloc bloc) => bloc.state);
    final selectProviderState =
        context.select((CounterProvider provider) => provider.counter);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$selectBlocState Bloc Counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '$selectProviderState Provider Counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
