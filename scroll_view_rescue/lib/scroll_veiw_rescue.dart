import 'package:flutter/material.dart';

class ScrollViewRescue extends StatelessWidget {
  const ScrollViewRescue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Label ${index + 1}'),
            );
          },
        ),
      ),
    );
  }
}
