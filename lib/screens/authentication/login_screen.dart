import 'package:events/core/constants/constants.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController firstnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormFieldWidget(
              textController: firstnameController,
              hintText: 'First Name',
              prefixIcon: Icons.person,
            ),
            kTextFieldHeight,
            TextFormFieldWidget(
              textController: passwordController,
              hintText: 'Password',
              prefixIcon: Icons.lock,
            ),
            kTextFieldHeight,
            CustomElevatedButton(
              height: 50,
              width: 100,
              onPressed: () {},
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
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.textController,
    required this.hintText,
    this.prefixIcon,
  });

  final TextEditingController textController;
  final String hintText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
