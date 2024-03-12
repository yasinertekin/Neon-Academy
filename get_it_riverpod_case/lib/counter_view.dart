import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it_riverpod_case/provider/counter_provider.dart';
import 'package:kartal/kartal.dart';

final class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          backgroundColor: context.general.randomColor,
          appBar: AppBar(title: const Text('Counter example')),
          body: Column(
            children: [
              Center(
                // Consumer is a builder widget that allows you to read providers.
                child: Consumer(
                  builder: (context, ref, _) {
                    final count = ref.watch(counterProvider);

                    return Text('$count');
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            // The read method is a utility to read a provider without listening to it
            onPressed: () => ref.read(counterProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
