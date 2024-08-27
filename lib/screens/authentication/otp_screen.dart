import 'package:events/application/authentication/bloc/auth_bloc.dart';
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
      listener: (context, state) {
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
                  hintText: 'Contact No',
                  errorText: 'Enter the contact No',
                ),
                kTextFieldHeight,
                CustomTextFormField(
                  textController: otpController,
                  hintText: 'Otp',
                  errorText: 'Enter the OTP',
                ),
                kTextFieldHeight,
                CustomElevatedButton(
                  height: 50,
                  width: 150,
                  onPressed: () => _submitForm(context),
                  backgroundColor: Colors.blue,
                  label: 'Submit',
                  labelColor: Colors.white,
                  labelSize: 16,
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
