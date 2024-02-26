import 'package:flutter/material.dart';

final class CustomSliderView extends StatefulWidget {
  const CustomSliderView({super.key});

  @override
  State<CustomSliderView> createState() => _CustomSliderViewState();
}

final class _CustomSliderViewState extends State<CustomSliderView> {
  double _sliderValue = 0.0;
  final int _minValue = 0;
  final int _maxValue = 100;
  final int _divisions = 100;
  final imagePath = 'assets/img_dragon.png';

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
            _DragonImage(imagePath: imagePath, sliderValue: _sliderValue),
            Text('Slider Value: ${_sliderValue.toInt()}'),
            Slider(
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
          ],
        ),
      ),
    );
  }
}

final class _DragonImage extends StatelessWidget {
  const _DragonImage({
    required this.imagePath,
    required double sliderValue,
  }) : _sliderValue = sliderValue;

  final String imagePath;
  final double _sliderValue;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      color: Color.lerp(
        Colors.green,
        Colors.red,
        _sliderValue / 100,
      ),
    );
  }
}
