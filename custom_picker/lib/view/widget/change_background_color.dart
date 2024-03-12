part of '../custom_picker_view.dart';

final class ChangeBackgroundColor extends StatelessWidget {
  const ChangeBackgroundColor({
    required this.imagePickerViewmodel,
    required this.pageController,
    super.key,
  });

  final ImagePickerViewmodel imagePickerViewmodel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = imagePickerViewmodel.users.backgroundColor;

    return Scaffold(
      backgroundColor: Color(int.parse(backgroundColor)),
      appBar: AppBar(
        title: const Text('Change Background Color'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ChangeRedColor(imagePickerViewmodel: imagePickerViewmodel),
              _ChangeGreenColor(imagePickerViewmodel: imagePickerViewmodel),
              _ChangeBlueColor(imagePickerViewmodel: imagePickerViewmodel),
            ],
          ),
          _NavigateHome(pageController: pageController),
        ],
      ),
    );
  }
}

class _NavigateHome extends StatelessWidget {
  const _NavigateHome({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pageController.jumpToPage(
          _CustomPickerViewEnum.home.index,
        );
      },
      child: const Text('Navigate to Home Page'),
    );
  }
}

class _ChangeBlueColor extends StatelessWidget {
  const _ChangeBlueColor({
    required this.imagePickerViewmodel,
    super.key,
  });

  final ImagePickerViewmodel imagePickerViewmodel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        imagePickerViewmodel
            .updateBackgroundColor(BackgroundColorEnum.blue.color);
      },
      child: const Text('Blue'),
    );
  }
}

class _ChangeGreenColor extends StatelessWidget {
  const _ChangeGreenColor({
    required this.imagePickerViewmodel,
    super.key,
  });

  final ImagePickerViewmodel imagePickerViewmodel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        imagePickerViewmodel
            .updateBackgroundColor(BackgroundColorEnum.green.color);
      },
      child: const Text('Green'),
    );
  }
}

class _ChangeRedColor extends StatelessWidget {
  const _ChangeRedColor({
    required this.imagePickerViewmodel,
    super.key,
  });

  final ImagePickerViewmodel imagePickerViewmodel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        imagePickerViewmodel
            .updateBackgroundColor(BackgroundColorEnum.red.color);
      },
      child: const Text('Red'),
    );
  }
}

enum BackgroundColorEnum {
  red('0XFFff0000'),
  blue('0XFF0083ff'),
  green('0XFF19ff00');

  final String color;

  const BackgroundColorEnum(this.color);
}
