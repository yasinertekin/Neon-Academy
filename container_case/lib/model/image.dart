import 'package:flutter/material.dart';

@immutable
final class Image {
  final String imagePath;

  const Image({this.imagePath = 'https://source.unsplash.com/random/800x600'});
}

@immutable
final class ImageList {
  const ImageList._();
  static final imagelist = [
    const Image(),
    const Image(),
    const Image(),
    const Image(),
  ];
}
