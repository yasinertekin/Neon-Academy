part of '../custom_picker_view.dart';

final class ChangeBackgroundColor extends StatefulWidget {
  const ChangeBackgroundColor({
    required this.imagePickerViewmodel,
    required this.pageController,
    super.key,
  });

  final ImagePickerViewmodel imagePickerViewmodel;
  final PageController pageController;

  @override
  State<ChangeBackgroundColor> createState() => _ChangeBackgroundColorState();
}

class _ChangeBackgroundColorState extends State<ChangeBackgroundColor> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.imagePickerViewmodel.users.backgroundColor;
// create some values
    var pickerColor = const Color(0xff443a49);
    const currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
    void changeColor(Color color) {
      setState(() => pickerColor = color);
      widget.imagePickerViewmodel.updateBackgroundColor(pickerColor);
    }

    return Scaffold(
      backgroundColor: widget.imagePickerViewmodel.users.backgroundColor,
      appBar: AppBar(
        title: const Text('Change Background Color'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Change Color'),
                onPressed: () {
                  showDialog<void>(
                    builder: (context) => AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                    ),
                    context: context,
                  );
                },
              ),
            ],
          ),
          _NavigateHome(pageController: widget.pageController),
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
        // imagePickerViewmodel
        //     .updateBackgroundColor(BackgroundColorEnum.blue.color);
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
        // imagePickerViewmodel
        //     .updateBackgroundColor(BackgroundColorEnum.green.color);
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
        // imagePickerViewmodel
        //     .updateBackgroundColor(BackgroundColorEnum.red.color);
      },
      child: const Text('Red'),
    );
  }
}

// enum BackgroundColorEnum {
//   red('0XFFff0000'),
//   blue('0XFF0083ff'),
//   green('0XFF19ff00');

//   final String color;

//   const BackgroundColorEnum(this.color);
// }
