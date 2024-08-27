


import 'package:events/core/constants/constants.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController firstnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFieldWidget(
                  textController: firstnameController,
                  hintText: 'First Name',
                  prefixIcon: Icons.person,
                  prefixIconColor: Colors.red,
                  errorText: 'Enter your first name',
                ),
                kTextFieldHeight,
                TextFormFieldWidget(
                  textController: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  prefixIconColor: Colors.red,
                  prefixIconSize: 12,
                  errorText: 'Enter your password',
                ),
                kTextFieldHeight,
                CustomElevatedButton(
                  height: 50,
                  width: 100,
                  onPressed: _submitForm,
                  backgroundColor: Colors.blue,
                  label: "Submit",
                  labelColor: Colors.white,
                  labelSize: 16,
                )
              ],
            )),
      ),
    );
  }

  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      print('Validated');
    }
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.textController,
    required this.hintText,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    required this.errorText,
    this.enabledBorderColor,
  });

  final TextEditingController textController;
  final String hintText;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final String errorText;
  final Color? enabledBorderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: prefixIconColor,
                size: prefixIconSize,
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}

