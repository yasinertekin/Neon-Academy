import 'package:flutter/material.dart';

final class CustomStepperView extends StatelessWidget {
  const CustomStepperView({super.key});

  @override
  Widget build(BuildContext context) {
    const stepList = StepList.steps;
    final counterViewModel = CounterViewModel();
    return Scaffold(
      body: ListenableBuilder(
        listenable: counterViewModel,
        builder: (context, child) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Current Step: ${counterViewModel.counter + 1}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              _CustomStepper(
                  counterViewModel: counterViewModel, stepList: stepList),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CustomStepper extends StatelessWidget {
  const _CustomStepper({
    required this.counterViewModel,
    required this.stepList,
  });

  final CounterViewModel counterViewModel;
  final List<StepList> stepList;

  @override
  Widget build(BuildContext context) {
    List<StepList> fiftySteps = [];

    for (int i = 1; i <= 50; i++) {
      fiftySteps.add(
        StepList(
          title: 'Step $i',
          content: 'Content for Step $i',
        ),
      );
    }

    return ColoredBox(
      color: Colors.pink,
      child: Stepper(
          stepIconBuilder: (context, index) {
            return const Icon(Icons.star);
          },
          controlsBuilder:
              (BuildContext context, ControlsDetails controlsDetails) {
            return _CustomControls(
              controlsDetails: controlsDetails,
            );
          },
          onStepContinue: () {
            counterViewModel.incrementCounter();
          },
          onStepCancel: () {
            counterViewModel.decrementCounter();
          },
          currentStep: counterViewModel.counter,
          physics: const NeverScrollableScrollPhysics(),
          connectorColor: const MaterialStatePropertyAll(Colors.blueAccent),
          steps: fiftySteps
              .map(
                (step) => Step(
                  title: Text(step.title),
                  content: Text(step.content),
                ),
              )
              .toList()),
    );
  }
}

final class _CustomControls extends StatelessWidget {
  const _CustomControls({
    required this.controlsDetails,
  });

  final ControlsDetails controlsDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <GestureDetector>[
        GestureDetector(
          onTap: controlsDetails.onStepContinue,
          child: const _CustomImage(
            imageUrl: 'https://picsum.photos/id/237/200/300',
          ),
        ),
        GestureDetector(
          onTap: controlsDetails.onStepCancel,
          child: const _CustomImage(),
        ),
      ],
    );
  }
}

final class _CustomImage extends StatelessWidget {
  const _CustomImage({
    this.imageUrl = 'https://picsum.photos/200/300',
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.network(
        imageUrl,
        width: 100,
        fit: BoxFit.fill,
        height: 100,
      ),
    );
  }
}

@immutable
final class StepList {
  final String title;
  final String content;

  const StepList({required this.title, required this.content});

  static const List<StepList> steps = <StepList>[
    StepList(
      title: 'Step 1',
      content: 'Content for Step 1',
    ),
  ];
}

final class CounterViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    if (_counter < 45) {
      _counter += 5;
    }
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter -= 5;
    }
    notifyListeners();
  }
}
