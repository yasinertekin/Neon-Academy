import 'package:custom_picker/service/image_picker_service.dart';
import 'package:custom_picker/view/custom_picker_view.dart';
import 'package:custom_picker/view_model/imace_picker_view_model.dart';
import 'package:flutter/material.dart';

mixin CustomPickerViewMixin on State<CustomPickerView> {
  late final PageController _pageController;

  /// pageController getter
  PageController get pageController => _pageController;

  final _imagePickerViewModel = ImagePickerViewmodel(
    imagePickerService: ImagePickerServiceImpl(),
  );

  /// imagePickerViewModel getter
  ImagePickerViewmodel get imagePickerViewModel => _imagePickerViewModel;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
