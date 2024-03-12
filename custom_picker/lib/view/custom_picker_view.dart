import 'dart:io';

import 'package:custom_picker/model/users.dart';
import 'package:custom_picker/view/mixin/custom_picker_view_mixin.dart';
import 'package:custom_picker/view_model/imace_picker_view_model.dart';
import 'package:flutter/material.dart';

part 'widget/change_age_view.dart';
part 'widget/change_background_color.dart';
part 'widget/change_font_view.dart';
part 'widget/home_view.dart';
part 'widget/pick_image.dart';

/// [CustomPickerView] is a [StatelessWidget]
///  that displays the custom picker view.
final class CustomPickerView extends StatefulWidget {
  /// [CustomPickerView] requires a [Key] to be unique.
  const CustomPickerView({super.key});

  @override
  State<CustomPickerView> createState() => _CustomPickerViewState();
}

final class _CustomPickerViewState extends State<CustomPickerView>
    with CustomPickerViewMixin {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: imagePickerViewModel,
      builder: (context, child) => PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: _CustomPickerViewEnum.values.length,
        itemBuilder: (context, index) {
          final customPickerViewEnum = _CustomPickerViewEnum.values[index];
          return customPickerViewEnum.getView(
            imagePickerViewModel.users,
            imagePickerViewModel,
            pageController,
          );
        },
      ),
    );
  }
}

extension on _CustomPickerViewEnum {
  Widget getView(
    Users users,
    ImagePickerViewmodel imagePickerViewModel,
    PageController pageController,
  ) {
    switch (this) {
      case _CustomPickerViewEnum.home:
        return _HomeView(
          users: users,
          imagePickerViewModel: imagePickerViewModel,
          pageController: pageController,
        );
      case _CustomPickerViewEnum.pickImage:
        return _PickImage(
          users: users,
          imagePickerViewModel: imagePickerViewModel,
          pageController: pageController,
        );
      case _CustomPickerViewEnum.changeFont:
        return _ChangeFontView(
          pageController: pageController,
          users: users,
          imagePickerViewModel: imagePickerViewModel,
        );
      case _CustomPickerViewEnum.changeaAge:
        return _ChangeAgeView(
          pageController,
          users,
          imagePickerViewModel,
        );
      case _CustomPickerViewEnum.changeColor:
        return ChangeBackgroundColor(
          imagePickerViewmodel: imagePickerViewModel,
          pageController: pageController,
        );
    }
  }
}

/// [_CustomPickerViewEnum] is an enum class
enum _CustomPickerViewEnum {
  /// [home] is the first page of the custom picker view.
  home,

  /// [pickImage] is the second page of the custom picker view.
  pickImage,

  /// [changeFont] is the third page of the custom picker view.
  changeFont,

  /// [changeaAge] is the fourth page of the custom picker view.
  changeaAge,

  changeColor,
}
