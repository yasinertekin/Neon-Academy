part of '../custom_page_view.dart';

final class _PageTitle extends StatelessWidget {
  const _PageTitle({
    required this.page,
  });

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
