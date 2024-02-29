part of '../custom_picker_view.dart';

final class _ChangeFontView extends StatelessWidget {
  const _ChangeFontView({
    required this.pageController,
    required this.users,
    required this.imagePickerViewModel,
  });

  final PageController pageController;
  final Users users;
  final ImagePickerViewmodel imagePickerViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Picker View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Change Font'),
          ),
          ElevatedButton(
            onPressed: () {
              imagePickerViewModel.updateFontStyle(
                users.fontStyle == FontStyle.normal
                    ? FontStyle.italic
                    : FontStyle.normal,
              );
            },
            child: const Text(
              'Change Font Style',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              pageController.jumpToPage(
                _CustomPickerViewEnum.changeaAge.index,
              );
            },
            child: const Text(
              'Next Page',
            ),
          ),
        ],
      ),
    );
  }
}
