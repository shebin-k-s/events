import 'dart:developer';

import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/authentication/signup_screen1.dart';
import 'package:events/screens/home/home_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController firstnameController = TextEditingController(text: "ddd");
  TextEditingController passwordController = TextEditingController(text: "ddd");

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current is AuthActionState,
      listener: (context, state) {
        log('login listen buid');
        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(),
            ),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Login',
                    fontSize: 32,
                    fontweight: FontWeight.bold,
                    fontColor: Colors.blue,
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: firstnameController,
                    labelText: 'First Name',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your first name',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                    prefixIcon: Icons.lock,
                    errorText: 'Enter your password',
                  ),
                  kTextFieldHeight,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      log('login button rebuild');
                      return CustomElevatedButton(
                        height: 50,
                        width: 150,
                        onPressed: state is AuthLoading
                            ? () {}
                            : () => _submitForm(context),
                        backgroundColor: Colors.blue,
                        label: "Submit",
                        labelColor: Colors.white,
                        labelSize: 16,
                        childWidget: state is AuthLoading
                            ? LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.white,
                                size: 40,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Create an account? ",
                        fontSize: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => SignupScreen1(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: "Sign in",
                          fontSize: 14,
                          fontweight: FontWeight.bold,
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

  void _submitForm(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
            LoginEvent(
              firstname: firstnameController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
