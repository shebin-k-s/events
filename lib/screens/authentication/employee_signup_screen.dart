import 'package:events/core/constants/constants.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

class EmployeeSignupScreen extends StatelessWidget {
  EmployeeSignupScreen({super.key});
  final List<String> accountTypes = ['Student', 'Employee', 'Other'];

  TextEditingController firstnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Sign Up',
                  fontSize: 32,
                  fontweight: FontWeight.bold,
                  fontColor: Colors.blue,
                ),
                kTextFieldHeight,
                kTextFieldHeight,
                CustomTextFormField(
                  textController: firstnameController,
                  hintText: 'Company name',
                  prefixIcon: Icons.person,
                  errorText: 'Enter your Company name',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: firstnameController,
                  hintText: 'Company location',
                  prefixIcon: Icons.person,
                  errorText: 'Enter your Company location',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: passwordController,
                  hintText: 'Company ID',
                  prefixIcon: Icons.language,
                  errorText: 'Enter your Company ID',
                ),
              
                kTextFieldHeight,
                CustomTextFormField(
                  textController: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  errorText: 'Enter your Password',
                  obscureText: true,
                ),
                kTextFieldHeight,
                CustomElevatedButton(
                  height: 50,
                  width: 170,
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  label: "Create Account",
                  labelColor: Colors.white,
                  labelSize: 16,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
