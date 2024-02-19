import 'package:flutter/material.dart';

@immutable

/// A destination.
final class Destination {
  /// Creates a destination.
  const Destination({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  /// The name of the destination.
  final String name;

  /// The description of the destination.
  final String description;

  /// The image URL of the destination.
  final String imageUrl;
}

@immutable

/// A list of destinations.
final class Destinations {
  const Destinations._();

  /// A list of all destinations.
  static final List<Destination> all = <Destination>[
    const Destination(
      name: 'Erzurum',
      description: 'Hilly and cold',
      imageUrl: 'assets/img_erzurum.png',
    ),
    const Destination(
      name: 'Kirklareli',
      description: 'Sunny and warm',
      imageUrl: 'assets/img_kirklareli.png',
    ),
    const Destination(
      name: 'Konya',
      description: 'Urban and busy',
      imageUrl: 'assets/img_konya.png',
    ),
  ];
}
