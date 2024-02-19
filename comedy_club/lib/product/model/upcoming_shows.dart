import 'package:flutter/material.dart';

@immutable

/// A model class for upcoming shows.
final class Shows {
  /// Creates a new instance of [Shows].
  const Shows({
    required this.title,
    required this.date,
    required this.location,
    required this.imageUrl,
  });

  /// The title of the show.
  final String title;

  /// The date of the show.
  final String date;

  /// The location of the show.
  final String location;

  /// The image URL of the show.
  final String imageUrl;
}

@immutable

/// A list of upcoming shows.
final class UpcomingShowsList {
  /// A list of upcoming shows.
  static final List<Shows> upcomingShows = <Shows>[
    const Shows(
      title: 'Comedy Night',
      date: 'Friday, 8:00 PM',
      location: 'Comedy Club',
      imageUrl: 'https://picsum.photos/200/300',
    ),
    const Shows(
      title: 'Stand-up Comedy',
      date: 'Saturday, 8:00 PM',
      location: 'Comedy Club',
      imageUrl: 'https://picsum.photos/200/300?grayscale',
    ),
    const Shows(
      title: 'Open Mic Night',
      date: 'Sunday, 8:00 PM',
      location: 'Comedy Club',
      imageUrl: 'https://picsum.photos/seed/picsum/200/300',
    ),
  ];
}
