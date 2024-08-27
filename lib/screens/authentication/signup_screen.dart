import 'package:events/core/constants/constants.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  TextEditingController firstnameController =
      TextEditingController(text: "ssss");
  TextEditingController passwordController = TextEditingController(text: "sss");

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
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
                      textController: firstnameController,
                      hintText: 'First Name',
                      prefixIcon: Icons.person,
                      prefixIconColor: Colors.red,
                      errorText: 'Enter your first name',
                      focusedBorderColor: Colors.green,
                      borderColor: Colors.red,
                      borderWidth: 2,
                      borderRadius: 15,
                    ),
                    kTextFieldHeight,
                    CustomTextFormField(
                      textController: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      prefixIcon: Icons.lock,
                      prefixIconColor: Colors.red,
                      errorText: 'Enter your password',
                      focusedBorderColor: Colors.green,
                      borderColor: Colors.red,
                      borderWidth: 2,
                      borderRadius: 15,
                    ),
                    kTextFieldHeight,
                    CustomElevatedButton(
                      height: 50,
                      width: 150,
                      onPressed: () {} ,
                      backgroundColor: Colors.blue,
                      label: "Submit",
                      labelColor: Colors.white,
                      labelSize: 16,
                    ),
                    SizedBox(height: 30),
                    // RichText(
                    //   text: TextSpan(
                    //     style: DefaultTextStyle.of(context).style,
                    //     children: [
                    //       TextSpan(
                    //         text: "Don't have an account? ",
                    //         style: TextStyle(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w400,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: "Sign up",
                    //         style: TextStyle(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.blue,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Already have an account? ",
                          fontSize: 14,
                        ),
                        GestureDetector(
                          onTap: (){
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
    );
  }
}
