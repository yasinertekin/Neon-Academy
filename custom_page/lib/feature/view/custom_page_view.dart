import 'package:custom_page/feature/view/mixin/custom_page_view_mixin.dart';
import 'package:custom_page/feature/view_model/custom_page_view_model.dart';
import 'package:custom_page/product/model/page_model.dart';
import 'package:flutter/material.dart';

part 'widget/current_page_image.dart';
part 'widget/page_description.dart';
part 'widget/page_icon.dart';
part 'widget/page_title.dart';

/// A [PageView] that displays a list of pages.
final class CustomPageView extends StatefulWidget {
  /// Creates a [CustomPageView].
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

final class _CustomPageViewState extends State<CustomPageView>
    with PageViewMixin {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => PageView.builder(
        onPageChanged: (index) {
          viewModel.updateCurrentPage(customPageViewType[index]);
        },
        controller: pageController,
        itemCount: customPageViewType.length,
        itemBuilder: (context, index) {
          final page = pageList[index];
          return _PageViewBody(
            page: page,
            viewModel: viewModel,
          );
        },
      ),
    );
  }
}

final class _PageViewBody extends StatelessWidget {
  const _PageViewBody({
    required this.page,
    required this.viewModel,
  });

  final PageModel page;
  final CustomPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: page.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (viewModel.currentPage == page.type)
              const _CurrentPageImage()
            else
              const SizedBox.shrink(),
            _PageTitle(page: page),
            _PageDescription(page: page),
            _PageIcon(page: page),
          ],
        ),
      ),
    );
  }
}
