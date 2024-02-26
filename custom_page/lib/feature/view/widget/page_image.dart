part of '../custom_page_view.dart';

final class _PageImage extends StatelessWidget {
  const _PageImage({
    required this.page,
  });

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      page.imagePath,
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.3,
    );
  }
}
