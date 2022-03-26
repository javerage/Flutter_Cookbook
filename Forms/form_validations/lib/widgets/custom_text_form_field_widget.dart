import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final bool autofocus;
  final TextInputAction textInputAction;
  final Function moveNextFocus;
  final bool isRequired;

  const CustomTextFormFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.none,
    this.textCapitalization = TextCapitalization.words,
    this.controller,
    this.autofocus = false,
    this.textInputAction = TextInputAction.none,
    required this.moveNextFocus, this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        autofocus: autofocus,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
        validator: _validateNullOrEmpty,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: textInputAction,
        onFieldSubmitted: (value) => moveNextFocus(),
      ),
    );
  }

  String? _validateNullOrEmpty(String? value) {
    if(!isRequired) {
      return null;
    }
    
    if (value == null) {
      return 'Please enter some text';
    }

    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
