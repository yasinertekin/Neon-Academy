part of '../custom_picker_view.dart';

final class _PickImage extends StatelessWidget {
  const _PickImage({
    required this.users,
    required this.imagePickerViewModel,
    required this.pageController,
  });

  final Users users;
  final ImagePickerViewmodel imagePickerViewModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Picker View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await imagePickerViewModel.pickImage();
                imagePickerViewModel
                    .updatePhoto(imagePickerViewModel.imagePath!);
              },
              child: const Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: () {
                pageController
                    .jumpToPage(_CustomPickerViewEnum.changeaAge.index);
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
