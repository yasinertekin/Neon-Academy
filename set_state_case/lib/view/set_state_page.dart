import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:set_state_case/mobx/counter_mobx.dart';

part '../mixin/set_state_view_mixin.dart';

final _counterMobx = CounterMobx();

final class SetStatePage extends StatelessWidget {
  const SetStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SetStateView();
  }
}

final class _SetStateView extends StatefulWidget {
  const _SetStateView();

  @override
  State<_SetStateView> createState() => _SetStateViewState();
}

final class _SetStateViewState extends State<_SetStateView>
    with SetStateVieMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isPressed ? Colors.blue : Colors.red,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterMobx.increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return Text(
                'You have pushed the button this many times: ${_counterMobx.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Text(
              _isPressed ? 'Pressed' : 'Not Pressed',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Switch.adaptive(
              value: _isPressed,
              onChanged: (bool value) {
                _togglePressed();
              },
            )
          ],
        ),
      ),
    );
  }
}
