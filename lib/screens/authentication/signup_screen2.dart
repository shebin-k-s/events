import 'package:events/core/constants/constants.dart';
import 'package:events/screens/authentication/employee_signup_screen.dart';
import 'package:events/screens/authentication/student_signup_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

  ValueNotifier<String?> selectedAccountTypeNotifier = ValueNotifier(null);
class SignupScreen2 extends StatelessWidget {
  SignupScreen2({super.key});
  final List<String> accountTypes = ['Student', 'Employee', 'Other'];

 final TextEditingController _contactNumberController = TextEditingController();
 final TextEditingController _whatsappNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
 final TextEditingController _stateIdController = TextEditingController();
 final TextEditingController _districtController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    textController: _contactNumberController,
                    hintText: 'Contact number',
                    prefixIcon: Icons.person,
                    errorText: 'Enter your Contact number',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _whatsappNumberController,
                    hintText: 'Whatsapp number',
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
                  CustomTextFormField(
                    textController: _countryController,
                    hintText: 'Country',
                    prefixIcon: Icons.language,
                    errorText: 'Enter your country',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _stateIdController,
                    hintText: 'State ID',
                   
                    prefixIcon: Icons.language,
                    errorText: 'Enter your State ID',
                  ),
                  kTextFieldHeight,
                  CustomTextFormField(
                    textController: _districtController,
                    hintText: 'District ID',
                    
                    prefixIcon: Icons.language,
                    errorText: 'Enter your District ID',
                  ),
                   kTextFieldHeight,
                  ValueListenableBuilder(
                    valueListenable: selectedAccountTypeNotifier,
                    builder: (context, selectedAccountType, _) {
                      return selectedAccountType=="Other"? CustomTextFormField(
                        textController: _passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        prefixIcon: Icons.lock,
                        errorText: 'Enter your Password',
                      ):SizedBox();
                    }
                  ),
                  kTextFieldHeight,
                  ValueListenableBuilder(
                    valueListenable: selectedAccountTypeNotifier,
                    builder: (context, selectedAccountType, _) {
                      return CustomElevatedButton(
                        height: 50,
                        width: 170,
                        onPressed: () {
                          if(selectedAccountType=="Student"){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StudentSignupScreen()));
                          }
                         else if(selectedAccountType=="Employee"){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmployeeSignupScreen()));
                         }else{

                         }
                        },
                        backgroundColor: Colors.blue,
                        label:selectedAccountType=="Other"? "Create Account":"Next",
                        labelColor: Colors.white,
                        labelSize: 16,
                      );
                    }
                  ),
                  SizedBox(height: 30),
                  
                ],
              )),
        ),
      ),
    );
  }
}
