import 'package:flutter/material.dart';
import 'package:form_validations/widgets/custom_text_form_field_widget.dart';

class CustomFormScreen extends StatefulWidget {
  const CustomFormScreen({Key? key}) : super(key: key);

  @override
  State<CustomFormScreen> createState() => _CustomFormScreenState();
}

class _CustomFormScreenState extends State<CustomFormScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const CustomTextFormFieldWidget(
                  hintText: 'First Name',
                  labelText: 'First Name',
                  keyboardType: TextInputType.name,
                ),
                const CustomTextFormFieldWidget(
                  hintText: 'Last Name',
                  labelText: 'Last Name',
                  keyboardType: TextInputType.name,
                ),
                const CustomTextFormFieldWidget(
                  hintText: 'Phone',
                  labelText: 'Phone',
                  keyboardType: TextInputType.phone,
                ),
                const CustomTextFormFieldWidget(
                  hintText: 'Email',
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Processing Data...')));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
