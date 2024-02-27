import 'package:flutter/material.dart';

final class CustomStack extends StatelessWidget {
  const CustomStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: orientation == Orientation.portrait ? 50 : 20,
                  left: orientation == Orientation.portrait ? 20 : 50,
                  child: const ColoredBox(
                    color: Colors.red,
                    child: Text(
                      'Expelliarmus',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: orientation == Orientation.portrait ? 50 : 20,
                  right: orientation == Orientation.portrait ? 20 : 50,
                  child: const ColoredBox(
                    color: Colors.green,
                    child: Text(
                      'Expecto Patronum',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  bottom: orientation == Orientation.portrait ? 50 : 20,
                  left: orientation == Orientation.portrait ? 20 : 50,
                  child: const ColoredBox(
                    color: Colors.yellow,
                    child: Text(
                      'Avada Kedavra',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  bottom: orientation == Orientation.portrait ? 50 : 20,
                  right: orientation == Orientation.portrait ? 20 : 50,
                  child: const ColoredBox(
                    color: Colors.blue,
                    child: Text(
                      'Alohomora',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
