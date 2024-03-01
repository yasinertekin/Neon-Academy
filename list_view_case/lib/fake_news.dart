import 'package:flutter/material.dart';

@immutable
final class FakeNews {
  final String title;
  final String description;
  final String imageUrl;

  const FakeNews({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

@immutable
final class FakeNewsList {
  static final List<FakeNews> news = [
    const FakeNews(
      title: 'Lincoln Dead',
      description:
          'killed in theatre | suspect still at large | tragic end to an incredible career | tributes',
      imageUrl: 'assets/img_one.png',
    ),
    const FakeNews(
      title: 'Lincoln Dead',
      description:
          'killed in theatre | suspect still at large | tragic end to an incredible career | tributes',
      imageUrl: 'assets/img_one.png',
    ),
    const FakeNews(
      title: 'Lincoln Dead',
      description:
          'killed in theatre | suspect still at large | tragic end to an incredible career | tributes',
      imageUrl: 'assets/img_one.png',
    ),
    const FakeNews(
      title: 'Class at work',
      description:
          'hexagons used to organise factors | arrows linking factors | extra research added later',
      imageUrl: 'assets/img_two.png',
    ),
    const FakeNews(
      title: 'Pop star eats hamster during live concert',
      description:
          "Hotel food 'simply not good enough' says Sheeran...'under pressure' says manager..",
      imageUrl: 'assets/img_three.png',
    ),
    const FakeNews(
      title: 'Pop star eats hamster during live concert',
      description:
          "Hotel food 'simply not good enough' says Sheeran...'under pressure' says manager..",
      imageUrl: 'assets/img_three.png',
    ),
    const FakeNews(
      title: 'Pop star eats hamster during live concert',
      description:
          "Hotel food 'simply not good enough' says Sheeran...'under pressure' says manager..",
      imageUrl: 'assets/img_three.png',
    ),
  ];
}
