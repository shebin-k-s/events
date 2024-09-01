import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/domain/user/user_model.dart';
import 'package:events/screens/authentication/otp_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeSignupScreen extends StatelessWidget {
  EmployeeSignupScreen({super.key, required this.employee});
  final List<String> accountTypes = ['Student', 'Employee', 'Other'];

  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyLocationController = TextEditingController();
  TextEditingController _companyIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => OtpScreen(),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
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
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _companyIdController,
                    labelText: 'Company name',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your Company name',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _companyLocationController,
                    labelText: 'Company location',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your Company location',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _companyIdController,
                    labelText: 'Company ID',
                    prefixIcon: Icons.language,
                    errorText: 'Enter your Company ID',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _passwordController,
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                    errorText: 'Enter your Password',
                    obscureText: true,
                  ),
                  kTextFieldHeight,
                  CustomElevatedButton(
                    height: 50,
                    width: 170,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            EmployeeSignupEvent(
                              employee: Employee(
                                firstName: employee.firstName,
                                secondName: employee.secondName,
                                email: employee.email,
                                purpose: employee.purpose,
                                country: employee.country,
                                stateId: employee.stateId,
                                districtId: employee.districtId,
                                contactNo: employee.contactNo ?? '123',
                                whatsappNo: employee.whatsappNo ?? '123',
                                password: _passwordController.text,
                                companyId: _companyIdController.text,
                                companyLocation:
                                    _companyLocationController.text,
                                companyName: _companyNameController.text,
                              ),
                            ),
                          );
                    },
                    backgroundColor: Colors.blue,
                    label: "Create Account",
                    labelColor: Colors.white,
                    labelSize: 16,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
