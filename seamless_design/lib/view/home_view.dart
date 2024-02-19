import 'package:flutter/material.dart';
import 'package:seamless_design/model/destination.dart';

part 'widget/destination_card.dart';

/// The home view.
final class HomeView extends StatelessWidget {
  /// Creates a new home view.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seamless Design'),
      ),
      body: const Column(
        children: [
          _DestinationList(),
        ],
      ),
    );
  }
}

final class _DestinationList extends StatelessWidget {
  const _DestinationList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: Destinations.all.length,
        itemBuilder: (BuildContext context, int index) {
          final destination = Destinations.all[index];
          return _DestinationCard(destination: destination);
        },
      ),
    );
  }
}
