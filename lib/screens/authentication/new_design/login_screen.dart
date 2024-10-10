import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/authentication/new_design/signup_screen.dart';
import 'package:events/screens/widgets/custom_formfield.dart';
import 'package:events/screens/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValueNotifier<bool> saveMeNotifier = ValueNotifier(false);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
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
                      'Sign in now to begin an amazing journey',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Sign in your Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    kTextFieldHeight,
                    CustomFormField(
                      label: 'Email',
                      hintText: 'Enter your Email',
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
                                    activeTrackColor: Colors.orange,
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
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
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
                      onTap: () => Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (ctx) => SignupScreen(),
                      )),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 138, 137, 137),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,)
                  ],
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
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
            LoginEvent(
              firstname: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
