import 'package:flutter/material.dart';

final class SwitchWizardView extends StatelessWidget {
  const SwitchWizardView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SwitchViewModel();
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => Scaffold(
        backgroundColor:
            viewModel.switchValue ? Colors.lightGreen : Colors.redAccent,
        body: _CustomSwitchAdaptive(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

final class _CustomSwitchAdaptive extends StatelessWidget {
  const _CustomSwitchAdaptive({
    required this.viewModel,
  });

  final SwitchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch.adaptive(
        thumbColor: MaterialStateProperty.all(Colors.black),
        value: viewModel.switchValue,
        activeColor: Colors.red,
        inactiveTrackColor: Colors.green,
        onChanged: (value) {
          viewModel.setSwitchValue(value);
        },
      ),
    );
  }
}

final class SwitchViewModel extends ChangeNotifier {
  bool _switchValue = false;
  bool get switchValue => _switchValue;

  void setSwitchValue(bool value) {
    _switchValue = value;
    notifyListeners();
  }

  void toggleSwitchValue() {
    _switchValue = !_switchValue;
    notifyListeners();
  }
}
