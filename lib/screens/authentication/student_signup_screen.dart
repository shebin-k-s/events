import 'package:events/core/constants/constants.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

class StudentSignupScreen extends StatelessWidget {
  StudentSignupScreen({super.key});
  final List<String> accountTypes = ['Student', 'Employee', 'Other'];

  final TextEditingController _collegeController = TextEditingController();
 final TextEditingController _universityController = TextEditingController();
   final TextEditingController _departmentNameController = TextEditingController();
 final TextEditingController _collegeRegNoController = TextEditingController();
 final TextEditingController _collegeIdPicController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

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
                  textController: _collegeController,
                  hintText: 'College',
                  prefixIcon: Icons.person,
                  errorText: 'Enter your College',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: _universityController,
                  hintText: 'University',
                  prefixIcon: Icons.person,
                  errorText: 'Enter your University',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: _departmentNameController,
                  hintText: 'Department name',
                  prefixIcon: Icons.language,
                  errorText: 'Enter your Department name',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: _collegeRegNoController,
                  hintText: 'College register number',
                  prefixIcon: Icons.language,
                  errorText: 'Enter your College register number',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: _collegeIdPicController,
                  hintText: 'College ID pic',
                  prefixIcon: Icons.language,
                  errorText: 'Enter your College ID pic',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: _passwordController,
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
