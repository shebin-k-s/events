import 'dart:developer';

import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/home/home_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  TextEditingController contactNoController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current is AuthActionState,
      listener: (context, state) {
        log('Otp listen build');
        if (state is OtpVerificationSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(),
            ),
          );
        } else if (state is OtpVerificationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "OTP Verification",
                  fontSize: 32,
                  fontColor: Colors.blue,
                  fontweight: FontWeight.bold,
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: contactNoController,
                  labelText: 'Contact No',
                  errorText: 'Enter the contact No',
                  prefixIcon: Icons.phone,
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: otpController,
                  labelText: 'Otp',
                  errorText: 'Enter the OTP',
                  prefixIcon: Icons.password,
                ),
                kTextFieldHeight,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    log('otp button rebuild');
                    return CustomElevatedButton(
                      height: 50,
                      width: 150,
                      onPressed: () => _submitForm(context),
                      backgroundColor: Colors.blue,
                      label: state is AuthLoading ? "Loading..." : "Submit",
                      labelColor: Colors.white,
                      labelSize: 16,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            OtpVerificationEvent(
              contactNo: contactNoController.text,
              otp: otpController.text,
            ),
          );
    }
  }
}
