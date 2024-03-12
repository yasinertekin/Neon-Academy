import 'package:flutter/material.dart';

/// TextFieldCaseView
final class TextFieldCaseView extends StatefulWidget {
  /// TextFieldCaseView constructor
  const TextFieldCaseView({super.key});

  @override
  State<TextFieldCaseView> createState() => _TextFieldCaseViewState();
}

class _TextFieldCaseViewState extends State<TextFieldCaseView> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final nameAndSurnameController = TextEditingController();

    var isValidEmail = false;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Case'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: _CustomTextField(
                  nameAndSurnameController,
                  'Enter Name-Surname',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _CustomTextField(
                  inputTextColor: Colors.blue,
                  emailController,
                  'Enter Email',
                  keyboardType: TextInputType.emailAddress,
                  errorText: 'Invalid Email',
                  onEditingComplete: (value) {
                    setState(() {
                      isValidEmail = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value);
                    });

                    if (!isValidEmail) {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const SizedBox(
                            height: 200,
                            child: Center(
                              child: Text(
                                'Geçersiz e-posta adresi',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  isValid: isValidEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _CustomTextField(
                  
                  phoneNumberController,
                  'Phone Number',
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  decoration: TextDecoration.underline,
                  inputTextColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CustomTextField extends StatefulWidget {
  const _CustomTextField(
    this.controller,
    this.hintText, {
    // ignore: unused_element
    this.keyboardType = TextInputType.text,
    // ignore: unused_element
    this.textInputAction = TextInputAction.next,

    // ignore: unused_element
    this.decoration = TextDecoration.none,

    // ignore: unused_element
    this.inputTextColor = Colors.red,

    // ignore: unused_element
    this.maxLines = 10,

    // ignore: unused_element
    this.errorText = 'Error Message',

    // ignore: unused_element
    this.isValid = true,

    // ignore: unused_element
    this.onEditingComplete,
  });

  final TextEditingController controller;

  final String hintText;

  final TextInputType keyboardType;

  final TextInputAction textInputAction;

  final Color inputTextColor;

  final TextDecoration decoration;

  final int maxLines;

  final String errorText;

  final bool isValid;

  final ValueChanged<String>? onEditingComplete;

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

final class _CustomTextFieldState extends State<_CustomTextField> {
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
    return TextFormField(
      controller: _controller,
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color: widget.inputTextColor,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: widget.decoration,
      ),
      obscureText: widget.keyboardType == TextInputType.visiblePassword,
      onFieldSubmitted: widget.onEditingComplete,
      validator: (value) {
        if (value!.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Colors.green,
          fontStyle: FontStyle.italic,
        ),
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
