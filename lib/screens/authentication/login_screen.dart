import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/authentication/signup_screen1.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController firstnameController =
      TextEditingController(text: "wetwr");
  TextEditingController passwordController = TextEditingController(text: "qweq");

  final _formkey = GlobalKey<FormState>();

  final AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    print("build...");
    return BlocConsumer(
      bloc: authBloc,
      listenWhen: (previous, current) => current is AuthActionState,
      // buildWhen: (previous, current) => current is! AuthActionState,
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) =>  SignupScreen1(),
            ),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("error"),
            ),
          );
        }
      },
      builder: (context, state) {
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
                    CustomElevatedButton(
                      height: 50,
                      width: 150,
                      onPressed: state is AuthLoading ? () {} : _submitForm,
                      backgroundColor: Colors.blue,
                      label: state is AuthLoading ? "Loading..." : "Submit",
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
                          text: "Don't have an account? ",
                          fontSize: 14,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupScreen1()));
                          },
                          child: CustomText(
                            text: "Sign up",
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
        );
      },
    );
  }

  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      authBloc.add(
        LoginEvent(
          firstname: firstnameController.text,
          password: passwordController.text,
        ),
      );
    }
  }
}
