part of '../custom_page_view.dart';

final class _CurrentPageImage extends StatelessWidget {
  const _CurrentPageImage();

  @override
  Widget build(BuildContext context) {
    const imagePath = 'assets/img_dog.png';
    return Image.asset(imagePath);
  }
}
