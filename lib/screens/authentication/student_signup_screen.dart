import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/domain/user/user_model.dart';
import 'package:events/screens/authentication/otp_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentSignupScreen extends StatelessWidget {
  StudentSignupScreen({super.key, required this.student});
  final List<String> accountTypes = ['Student', 'Employee', 'Other'];

  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _departmentNameController =
      TextEditingController();
  final TextEditingController _collegeRegNoController = TextEditingController();
  final TextEditingController _collegeIdPicController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final Student student;

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
                    textController: _collegeController,
                    labelText: 'College',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your College',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _universityController,
                    labelText: 'University',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your University',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _departmentNameController,
                    labelText: 'Department name',
                    prefixIcon: Icons.language,
                    errorText: 'Enter your Department name',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _collegeRegNoController,
                    labelText: 'College register number',
                    prefixIcon: Icons.language,
                    errorText: 'Enter your College register number',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _collegeIdPicController,
                    labelText: 'College ID pic',
                    prefixIcon: Icons.language,
                    errorText: 'Enter your College ID pic',
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
                            StudentSignupEvent(
                              student: Student(
                                firstName: student.firstName,
                                secondName: student.secondName,
                                email: student.email,
                                purpose: student.purpose,
                                country: student.country,
                                stateId: student.stateId,
                                districtId: student.districtId,
                                contactNo: student.contactNo ?? '123',
                                whatsappNo: student.whatsappNo ?? '123',
                                password: _passwordController.text,
                                clgIdPic: _collegeIdPicController.text,
                                clgRegNo: _collegeRegNoController.text,
                                college: _collegeController.text,
                                deptName: _departmentNameController.text,
                                university: _universityController.text,
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
