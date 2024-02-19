/// This file contains the enum for the images used in the app.
enum ImageEnum {
  /// The image for the Comedy Club.
  imgComedyClub,
}

/// The extension for the [ImageEnum].
extension ImageEnumExtension on ImageEnum {
  /// The value of the image.
  String get value {
    switch (this) {
      case ImageEnum.imgComedyClub:
        return 'https://m.media-amazon.com/images/M/MV5BMWYwNzZiMGQtN2EzNS00ZDczLWJkYmItMDFiNzUzMmJlOWE1XkEyXkFqcGdeQXVyMjM5NTM1NjQ@._V1_.jpg';
    }
  }
}
