import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;

  const CustomTextFormFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.none,
    this.textCapitalization = TextCapitalization.words,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: TextFormField(
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
        validator: _validateNullOrEmpty,
      ),
    );
  }

  String? _validateNullOrEmpty(String? value) {
    if (value == null) {
      return 'Please enter some text';
    }

    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
