import 'dart:developer';

import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/screens/authentication/forgot_password.dart/otp_verify_screen.dart';
import 'package:events/screens/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});
  TextEditingController usernameController =
      TextEditingController(text: "shebin@gmail.com");

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current is AuthActionState,
      listener: (context, state) {
        if (state is ForgotSuccess) {
          showTopSnackBar(
              context, state.message, Colors.green, Icons.check_circle);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => OtpVerifyScreen(),
            ),
          );
        } else if (state is ForgotFailure) {
          showTopSnackBar(context, state.error, Colors.red, Icons.cancel);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_back_outlined,
                              color: Color(0xff464196),
                              size: 32,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Need Help?",
                                style: TextStyle(
                                  color: Color(0xff464196),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            "assets/images/forgot_lock.svg",
                            width: 65,
                            height: 65,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Enter your Username or registered Email-id.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                label: Text("Enter Username or Email"),
                                floatingLabelStyle: TextStyle(
                                  color: Color(0xff464196),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    color: Color(0xff464196),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      log("pressed");
                      context.read<AuthBloc>().add(
                            SendForgotOtpEvent(
                              userameOrEmail: usernameController.text,
                            ),
                          );
                      //  context.read<AuthBloc>().add(
                      //       VerifyForgotOtpEvent(
                      //         contact: "shebin@gmail.com",
                      //         otp:657740
                      //       ),
                      //     );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff464196),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        return const Text(
                          "Send OTP",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
