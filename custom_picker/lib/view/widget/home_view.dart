part of '../custom_picker_view.dart';

final class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.imagePickerViewModel,
    required this.users,
    required this.pageController,
  });

  final ImagePickerViewmodel imagePickerViewModel;
  final Users users;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final dateTimeYear = DateTime.now().year;
    final age = dateTimeYear - users.age.year;

    return Scaffold(
      backgroundColor: Color(int.parse(users.backgroundColor)),
      appBar: AppBar(
        title: Text(
          'Custom Picker View',
          style: TextStyle(
            fontStyle: users.fontStyle,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Age: $age',
              style: TextStyle(
                fontStyle: users.fontStyle,
              ),
            ),
            Text(
              'Name: ${users.name}',
              style: TextStyle(
                fontStyle: users.fontStyle,
              ),
            ),
            if (imagePickerViewModel.imagePath != null)
              Image.file(
                height: 200,
                width: 200,
                File(
                  imagePickerViewModel.imagePath!,
                ),
              )
            else
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.image,
                  size: 200,
                ),
              ),
            ElevatedButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Text(
                'Next Page',
                style: TextStyle(
                  fontStyle: users.fontStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
