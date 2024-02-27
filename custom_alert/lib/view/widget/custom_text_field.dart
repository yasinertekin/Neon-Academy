part of '../custom_alert_view.dart';

final class _CustomTextFild extends StatefulWidget {
  const _CustomTextFild(
    this.controller,
    this.onChanged,
  );

  final TextEditingController controller;

  final ValueChanged<String>? onChanged;

  @override
  State<_CustomTextFild> createState() => _CustomTextFildState();
}

final class _CustomTextFildState extends State<_CustomTextFild> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your name',
      ),
    );
  }
}
