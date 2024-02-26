import 'package:flutter/material.dart';
import 'package:stepper/custom_stepper_view.dart';

mixin CustomStepperMixin<StatelessWidget extends CustomStepperView> {
  final stepList = StepList.steps;
  final counterViewModel = CounterViewModel();
  Color getTileColor(int index) {
    final incrementValue = counterViewModel.getIncrementValue();
    final colorIndex =
        incrementValue ~/ 5; // Divide by 5 to determine color index
    return index == colorIndex ? Colors.orange : Colors.white;
  }
}
