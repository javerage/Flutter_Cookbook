import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late FocusScopeNode _myFocusNode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _myFocusNode = FocusScopeNode();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
      },
      child: Form(
        key: _formKey,
        child: FocusScope(
          node: _myFocusNode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                _buildImgProfile(),
                const SizedBox(height: 7),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CustomTextFormFieldWidget(
                          hintText: 'First Name',
                          labelText: 'First Name',
                          keyboardType: TextInputType.name,
                          controller: _firstNameController,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          moveNextFocus: _moveNextFocus,
                        ),
                        CustomTextFormFieldWidget(
                          hintText: 'Last Name',
                          labelText: 'Last Name',
                          keyboardType: TextInputType.name,
                          controller: _lastNameController,
                          textInputAction: TextInputAction.next,
                          moveNextFocus: _moveNextFocus,
                        ),
                        CustomTextFormFieldWidget(
                          hintText: 'Phone',
                          labelText: 'Phone',
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          textInputAction: TextInputAction.next,
                          moveNextFocus: _moveNextFocus,
                        ),
                        CustomTextFormFieldWidget(
                          hintText: 'Email',
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          textInputAction: TextInputAction.done,
                          moveNextFocus: _sayHello,
                        ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildImgProfile() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2016/12/31/21/22/discus-fish-1943755_960_720.jpg'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _sayHello() {
    _myFocusNode.unfocus();
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Processing Data ${_firstNameController.text}, ${_lastNameController.text}, ${_phoneController.text}, ${_emailController.text}...')));
    }
  }

  void _moveNextFocus() {
    _myFocusNode.nextFocus;
  }
}
