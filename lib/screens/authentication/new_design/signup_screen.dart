import 'dart:developer';

import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/authentication/new_design/login_screen.dart';
import 'package:events/screens/authentication/otp_screen.dart';
import 'package:events/screens/authentication/otp_verification_screen.dart';
import 'package:events/screens/widgets/custom_formfield.dart';
import 'package:events/screens/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final ValueNotifier<bool> saveMeNotifier = ValueNotifier(false);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => OtpVerificationScreen(
                contact: emailController.text,
              ),
            ),
          );
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 100,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      kTextFieldHeight,
                      const Text(
                        'Sign up now to begin an amazing journey',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Sign up your Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      kTextFieldHeight,
                      CustomFormField(
                        label: 'Country',
                        hintText: 'Enter your Country code',
                        controller: nameController,
                      ),
                      kTextFieldHeight,
                      CustomFormField(
                        label: 'Email/Phone',
                        hintText: 'Enter your Email/Phone',
                        controller: emailController,
                      ),
                      kTextFieldHeight,
                      CustomFormField(
                        label: 'Password',
                        hintText: 'Enter your password',
                        controller: passwordController,
                        hide: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: saveMeNotifier,
                                  builder: (context, saveMe, child) {
                                    return Switch(
                                      value: saveMe,
                                      onChanged: (value) =>
                                          saveMeNotifier.value = value,
                                      activeColor: Colors.white,
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey[300],
                                      activeTrackColor: Colors.blue,
                                    );
                                  }),
                              const Text('Save me'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _submitForm(context),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Or sign in with'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SocialMediaIcons(),
                      const SizedBox(height: 20),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Have an account? ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 138, 137, 137),
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      log("submitting");
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
            OtherSignupEvent(
              countryCode: "+91",
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
