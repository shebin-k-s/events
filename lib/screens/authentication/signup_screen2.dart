import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/domain/user/user_model.dart';
import 'package:events/screens/authentication/employee_signup_screen.dart';
import 'package:events/screens/authentication/otp_screen.dart';
import 'package:events/screens/authentication/student_signup_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ValueNotifier<String?> selectedAccountTypeNotifier = ValueNotifier(null);

class SignupScreen2 extends StatelessWidget {
  SignupScreen2({
    super.key,
    required this.user,
  });
  final List<String> accountTypes = ['Student', 'Employee', 'Other'];

  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _whatsappNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final User user;

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
        body: SafeArea(
          child: SingleChildScrollView(
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
                        textController: _contactNumberController,
                        labelText: 'Contact number',
                        prefixIcon: Icons.person,
                        errorText: 'Enter your Contact number',
                      ),
                      kTextFieldHeight,
                      CustomTextFormField(
                        textController: _whatsappNumberController,
                        labelText: 'Whatsapp number',
                        prefixIcon: Icons.person,
                        errorText: 'Enter your Whatsapp number',
                      ),
                      kTextFieldHeight,
                      ValueListenableBuilder(
                        valueListenable: selectedAccountTypeNotifier,
                        builder: (context, selectedAccountType, _) {
                          return Container(
                            width: double.infinity,
                            padding:
                                EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              value: selectedAccountType,
                              hint: Text(
                                'Select Account Type',
                              ),
                              items: accountTypes.map((String accountType) {
                                return DropdownMenuItem<String>(
                                  value: accountType,
                                  child: Text(accountType),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                selectedAccountTypeNotifier.value = newValue;
                              },
                            )),
                          );
                        },
                      ),
                      kTextFieldHeight,
                      ValueListenableBuilder(
                          valueListenable: selectedAccountTypeNotifier,
                          builder: (context, selectedAccountType, _) {
                            return selectedAccountType == "Other"
                                ? CustomTextFormField(
                                    textController: _passwordController,
                                    labelText: 'Password',
                                    obscureText: true,
                                    prefixIcon: Icons.lock,
                                    errorText: 'Enter your Password',
                                  )
                                : SizedBox();
                          }),
                      kTextFieldHeight,
                      ValueListenableBuilder(
                          valueListenable: selectedAccountTypeNotifier,
                          builder: (context, selectedAccountType, _) {
                            return CustomElevatedButton(
                              height: 50,
                              width: 170,
                              onPressed: () {
                                if (selectedAccountType == "Student") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => StudentSignupScreen(
                                        student: Student(
                                          firstName: user.firstName,
                                          secondName: user.secondName,
                                          email: user.email,
                                          purpose: user.purpose,
                                          country: user.country,
                                          stateId: user.stateId,
                                          districtId: user.districtId,
                                          contactNo:
                                              _contactNumberController.text,
                                          whatsappNo:
                                              _whatsappNumberController.text,
                                          password: _passwordController.text,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (selectedAccountType == "Employee") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EmployeeSignupScreen(
                                        employee: Employee(
                                          firstName: user.firstName,
                                          secondName: user.secondName,
                                          email: user.email,
                                          purpose: user.purpose,
                                          country: user.country,
                                          stateId: user.stateId,
                                          districtId: user.districtId,
                                          contactNo:
                                              _contactNumberController.text,
                                          whatsappNo:
                                              _whatsappNumberController.text,
                                          password: _passwordController.text,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  context.read<AuthBloc>().add(
                                        OtherSignupEvent(
                                          other: User(
                                            firstName: user.firstName,
                                            secondName: user.secondName,
                                            email: user.email,
                                            purpose: user.purpose,
                                            country: user.country,
                                            stateId: user.stateId,
                                            districtId: user.districtId,
                                            contactNo:
                                                _contactNumberController.text,
                                            whatsappNo:
                                                _whatsappNumberController.text,
                                            password: _passwordController.text,
                                          ),
                                        ),
                                      );
                                }
                              },
                              backgroundColor: Colors.blue,
                              label: selectedAccountType == "Other"
                                  ? "Create Account"
                                  : "Next",
                              labelColor: Colors.white,
                              labelSize: 16,
                            );
                          }),
                      SizedBox(height: 30),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
