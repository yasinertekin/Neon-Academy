part of '../custom_page_view.dart';

final class _PageDescription extends StatelessWidget {
  const _PageDescription({
    required this.page,
  });

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.description,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
