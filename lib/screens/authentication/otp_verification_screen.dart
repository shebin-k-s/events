import 'dart:developer';

import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/home/home_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key, required this.contact});

  final _formkey = GlobalKey<FormState>();
  final String contact;
  String otp = "";

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                CustomText(
                  text: "Enter your verification code",
                  fontSize: 24,
                  fontweight: FontWeight.w600,
                ),
                SizedBox(height: 10),
                CustomText(
                  text:
                      "We have sent the code verification\nto your mobile number",
                  fontColor: Colors.grey,
                  textAlign: TextAlign.center,
                  fontSize: 14,
                ),
                SizedBox(height: 10),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline, // Set the shape to box

                    fieldWidth: 45,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    selectedColor: Colors.blue,
                    activeFillColor: Colors.red,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    borderRadius:
                        BorderRadius.circular(0), // Set border radius to 0
                  ),
                  onCompleted: (value) {
                    print("completed typing");
                    print(value);
                    otp = value;
                  },
                ),
                SizedBox(height: 40),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    log('otp button rebuild');
                    return CustomElevatedButton(
                      height: 60,
                      width: double.infinity,
                      onPressed: () => _submitForm(context),
                      backgroundColor: Colors.blue,
                      label: "Verify",
                      labelColor: Colors.white,
                      labelSize: 16,
                      borderRadius: 30,
                    );
                  },
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: "Resend ",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                    children: [
                      TextSpan(
                        text: "in 14 seconds",
                        style: TextStyle(
                          color: Colors.black,
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
    );
  }

  void _submitForm(BuildContext context) {
    print("submitting form");
    if (_formkey.currentState!.validate()) {
      print("form is valid");
      context.read<AuthBloc>().add(
            OtpVerificationEvent(
              contactNo: contact,
              otp: otp,
            ),
          );
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               SizedBox(height: 40),
  //               CustomText(
  //                 text: "Enter your verification code",
  //                 fontSize: 24,
  //                 fontweight: FontWeight.w600,
  //               ),
  //               SizedBox(height: 10),
  //               CustomText(
  //                 text:
  //                     "We have sent the code verification\nto your mobile number",
  //                 fontColor: Colors.grey,
  //                 textAlign: TextAlign.center,
  //                 fontSize: 14,
  //               ),
  //               SizedBox(height: 10),
  //               PinCodeTextField(
  //                 appContext: context,
  //                 length: 6,
  //                 pinTheme: PinTheme(
  //                   shape: PinCodeFieldShape.underline, // Set the shape to box

  //                   fieldWidth: 45,
  //                   activeColor: Colors.blue,
  //                   inactiveColor: Colors.grey,
  //                   selectedColor: Colors.blue,
  //                   activeFillColor: Colors.red,
  //                   inactiveFillColor: Colors.white,
  //                   selectedFillColor: Colors.white,
  //                   borderRadius:
  //                       BorderRadius.circular(0), // Set border radius to 0
  //                 ),
  //                 onCompleted: (value) {
  //                   print("completed typing");
  //                   print(value);
  //                 },
  //               ),
  //               SizedBox(height: 10),
  //               Container(
  //                 height: 40,
  //                 width: double.infinity,
  //               ),
  //               SizedBox(height: 10),
  //               CustomElevatedButton(
  //                 height: 60,
  //                 width: double.infinity,
  //                 onPressed: () {},
  //                 backgroundColor: Colors.blue,
  //                 label: "Verify",
  //                 labelColor: Colors.white,
  //                 labelSize: 16,
  //                 borderRadius: 30,
  //               ),
  //               SizedBox(height: 10),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
