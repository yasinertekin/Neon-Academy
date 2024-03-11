part of '../view/set_state_page.dart';

// ignore: library_private_types_in_public_api
mixin SetStateVieMixin on State<_SetStateView> {
  bool _isPressed = false;

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }
}
