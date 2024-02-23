part of '../custom_page_view.dart';

final class _PageIcon extends StatelessWidget {
  const _PageIcon({
    required this.page,
  });

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return Icon(
      page.icon,
      size: 100,
    );
  }
}
