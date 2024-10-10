import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'dart:developer';
import 'package:events/screens/authentication/otp_verification_screen.dart';
import 'package:events/screens/profile/profile_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController firstnameController =
      TextEditingController(text: "ajs");
  TextEditingController passwordController =
      TextEditingController(text: "123456789");

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    log("build...");
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProfileScreen(),
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      print('button rebuild');
                      return CustomElevatedButton(
                        height: 50,
                        width: 150,
                        onPressed: state is AuthLoading
                            ? () {}
                            : () => _submitForm(context),
                        backgroundColor: Colors.blue,
                        label: state is AuthLoading ? "Loading..." : "Submit",
                        labelColor: Colors.white,
                        labelSize: 16,
                      );
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LoginEvent(
              firstname: firstnameController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
