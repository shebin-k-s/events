import 'package:events/core/constants/constants.dart';
import 'package:events/screens/authentication/signup_screen2.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

class SignupScreen1 extends StatelessWidget {
  SignupScreen1({super.key});

 final TextEditingController _firstnameController = TextEditingController();
 final TextEditingController _secondnameController = TextEditingController();
 final TextEditingController _emailController = TextEditingController();

 final TextEditingController _purposeController = TextEditingController();
 final TextEditingController _countryController = TextEditingController();
 final TextEditingController _stateIdController = TextEditingController();
 final TextEditingController _districtController = TextEditingController();

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
                  CustomTextFormField(
                    textController: _firstnameController,
                    hintText: 'First Name',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your first name',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _secondnameController,
                    hintText: 'Second Name',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your second name',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your email',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _purposeController,
                    hintText: 'Purpose',
                    prefixIcon: Icons.work,
                    errorText: 'Enter your purpose',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _countryController,
                    hintText: 'Country',
                    prefixIcon: Icons.language,
                    errorText: 'Enter your country',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _stateIdController,
                    hintText: 'State ID',
                    prefixIcon: Icons.language,
                    errorText: 'Enter your State ID',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _districtController,
                    hintText: 'District ID',
                   
                    prefixIcon: Icons.language,
                    errorText: 'Enter your District ID',
                  ),
                  kTextFieldHeight,
                  CustomElevatedButton(
                    height: 50,
                    width: 150,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupScreen2()));
                    },
                    backgroundColor: Colors.blue,
                    label: "Next",
                    labelColor: Colors.white,
                    labelSize: 16,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Already have an account? ",
                        fontSize: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomText(
                          text: "Log in",
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          fontColor: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
