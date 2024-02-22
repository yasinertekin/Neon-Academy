import 'package:flutter/material.dart';

final class CustomSliderView extends StatefulWidget {
  const CustomSliderView({super.key});

  @override
  State<CustomSliderView> createState() => _CustomSliderViewState();
}

class _CustomSliderViewState extends State<CustomSliderView> {
  double _sliderValue = 0.0;
  final int _minValue = 0;
  final int _maxValue = 100;
  final int _divisions = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dragon Slider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red,
                inactiveTrackColor: Colors.green,
                thumbColor: Colors.blue,
                overlayColor: Colors.blue.withAlpha(32),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 20.0),
              ),
              child: Slider(
                value: _sliderValue,
                min: _minValue.toDouble(),
                max: _maxValue.toDouble(),
                divisions: _divisions,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
