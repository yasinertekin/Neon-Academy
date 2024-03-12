part of '../custom_picker_view.dart';

final class _ChangeAgeView extends StatelessWidget {
  const _ChangeAgeView(
    this.pageController,
    this.users,
    this.imagePickerViewModel,
  );

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
        children: [
          const Center(
            child: Text('Change Age'),
          ),
          ElevatedButton(
            onPressed: () async {
              final dateTime = showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              await dateTime.then((value) {
                if (value != null) {
                  imagePickerViewModel.updateAge(value);
                }
              });
            },
            child: const Text(
              'Select Age',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              pageController.jumpToPage(
                _CustomPickerViewEnum.changeColor.index,
              );
            },
            child: const Text('Navigate to Color Page'),
          ),
        ],
      ),
    );
  }
}
