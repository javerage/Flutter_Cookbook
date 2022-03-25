import 'package:flutter/material.dart';
import 'package:form_validations/widgets/custom_text_form_field_widget.dart';

class CustomFormScreen extends StatefulWidget {
  const CustomFormScreen({Key? key}) : super(key: key);

  @override
  State<CustomFormScreen> createState() => _CustomFormScreenState();
}

class _CustomFormScreenState extends State<CustomFormScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CustomTextFormFieldWidget(
                  hintText: 'First Name',
                  labelText: 'First Name',
                  keyboardType: TextInputType.name,
                  controller: _firstNameController,
                ),
                CustomTextFormFieldWidget(
                  hintText: 'Last Name',
                  labelText: 'Last Name',
                  keyboardType: TextInputType.name,
                  controller: _lastNameController,
                ),
                CustomTextFormFieldWidget(
                  hintText: 'Phone',
                  labelText: 'Phone',
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                ),
                CustomTextFormFieldWidget(
                  hintText: 'Email',
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Text('Submit'),
                    ),
                    onPressed: _sayHello,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  _sayHello() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Processing Data ${_firstNameController.text}, ${_lastNameController.text}, ${_phoneController.text}, ${_emailController.text}...')));
    }
  }
}
