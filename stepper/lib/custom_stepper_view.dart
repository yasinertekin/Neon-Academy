import 'package:flutter/material.dart';
import 'package:stepper/custom_stepper_mixin.dart';

/// Custom Stepper View
final class CustomStepperView extends StatelessWidget with CustomStepperMixin {
  /// Custom Stepper View
  CustomStepperView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: counterViewModel,
      builder: (context, child) => Scaffold(
        appBar: _CustomStepperViewAppBar(counterViewModel: counterViewModel),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: stepList.length,
                itemBuilder: (BuildContext context, int index) {
                  final step = stepList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      tileColor: getTileColor(index),
                      title: Text(step.title),
                      subtitle: Text(step.content),
                      leading: Icon(step.icon),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
            _Buttons(counterViewModel: counterViewModel),
          ],
        ),
      ),
    );
  }
}

final class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.counterViewModel,
  });

  final CounterViewModel counterViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: counterViewModel.increment,
          child: const Text('Next'),
        ),
        ElevatedButton(
          onPressed: counterViewModel.decrement,
          child: const Text('Back'),
        ),
      ],
    );
  }
}

final class _CustomStepperViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomStepperViewAppBar({
    required this.counterViewModel,
  });

  final CounterViewModel counterViewModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Text(
          'Counter: ${counterViewModel.counter}',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@immutable

/// Step List
final class StepList {
  /// Step List
  const StepList({
    required this.title,
    required this.icon,
    required this.content,
    this.backgroundColor = Colors.white,
  });

  /// Title
  final String title;

  /// Content
  final String content;

  /// Background Color
  final Color backgroundColor;

  final IconData icon;

  static const List<StepList> steps = <StepList>[
    StepList(
      title: 'Step 1',
      content: 'Content for Step 1',
      icon: Icons.ac_unit,
    ),
    StepList(
      title: 'Step 2',
      content: 'Content for Step 2',
      icon: Icons.access_alarm,
    ),
    StepList(
      title: 'Step 3',
      content: 'Content for Step 3',
      icon: Icons.access_time,
    ),
    StepList(
      title: 'Step 4',
      content: 'Content for Step 4',
      icon: Icons.accessible,
    ),
    StepList(
      title: 'Step 5',
      content: 'Content for Step 5',
      icon: Icons.account_balance,
    ),
    StepList(
      title: 'Step 6',
      content: 'Content for Step 6',
      icon: Icons.account_balance_wallet,
    ),
    StepList(
      title: 'Step 7',
      content: 'Content for Step 7',
      icon: Icons.account_box,
    ),
    StepList(
      title: 'Step 8',
      content: 'Content for Step 8',
      icon: Icons.account_circle,
    ),
    StepList(
      title: 'Step 9',
      content: 'Content for Step 9',
      icon: Icons.add,
    ),
    StepList(
      title: 'Step 10',
      content: 'Content for Step 10',
      icon: Icons.add_a_photo,
    ),
    StepList(
      title: 'Step 11',
      content: 'Content for Step 11',
      icon: Icons.add_alarm,
    ),
  ];

  /// Copy With
  StepList copyWith({
    String? title,
    String? content,
    Color? backgroundColor,
    bool? isActive,
    IconData? icon,
  }) {
    return StepList(
      title: title ?? this.title,
      content: content ?? this.content,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      icon: icon ?? this.icon,
    );
  }
}

final class CounterViewModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    if (_counter < 50) _counter += 5;

    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter -= 5;
    }

    notifyListeners();
  }

  int getIncrementValue() {
    return _counter;
  }
}
