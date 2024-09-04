import 'dart:developer';
import 'dart:io';

import 'package:events/application/profile/profile_bloc.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/authentication/login_screen.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  final String userType;

  EditProfileScreen({super.key, required this.userType});

  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String> _initialValues = {};

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(LoadProfileEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color.fromARGB(255, 229, 201, 146),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Form(
          key: _formKey,
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProfileLoaded) {
                final profile = state.profile;
                final fields = {
                  'First Name': profile.firstName,
                  'Second Name': profile.secondName,
                  'Email': profile.email,
                  'Purpose': profile.purpose,
                  'College': profile.college,
                  'University': profile.university,
                  'Department': profile.deptName,
                  'Admission No': profile.admissionNo,
                  'College Reg No': profile.clgRegno,
                  'Company Name': profile.companyName,
                  'Company ID': profile.companyId,
                  'Company Location': profile.companyLocation,
                  'Country': profile.country.toString(),
                  'State ID': profile.stateId.toString(),
                  'District ID': profile.districtId.toString(),
                  'Contact No': profile.contactNo,
                  'WhatsApp No': profile.whatsappNo,
                  'OTP': profile.otp,
                  'OTP Status': profile.otpStatus,
                  'Password Hash': profile.passwordHash,
                  'Auth Key': profile.authKey,
                  'Verification Token': profile.verificationToken,
                  'Status': profile.status.toString(),
                  'Created At': profile.createdAt.toString(),
                  'Updated At': profile.updatedAt.toString(),
                  'Created By': profile.createdBy.toString(),
                  'Updated By': profile.updatedBy.toString(),
                };

                final nonNullFields = fields.entries
                    .where(
                      (entry) => entry.value != null && entry.value!.isNotEmpty,
                    )
                    .toList();

                for (final entry in nonNullFields) {
                  _controllers[entry.key] =
                      TextEditingController(text: entry.value);
                  _initialValues[entry.key] = entry.value!;
                }

                return ListView.separated(
                  itemCount: nonNullFields.length + 3,
                  itemBuilder: (context, index) {
                    if (index == 0 || index == nonNullFields.length + 2) {
                      return const SizedBox(height: 20);
                    } else if (index <= nonNullFields.length) {
                      final entry = nonNullFields[index - 1];
                      return CustomTextFormField(
                        textController: _controllers[entry.key]!,
                        labelText: entry.key,
                        errorText: 'Please enter the ${entry.key}',
                        readOnly: false,
                      );
                    } else {
                      return CustomElevatedButton(
                        height: 50,
                        width: 70,
                        onPressed: () {
                          _submitForm();
                        },
                        backgroundColor: Colors.blue,
                        label: 'Save',
                        labelColor: Colors.white,
                        labelSize: 16,
                      );
                    }
                  },
                  separatorBuilder: (context, index) => kTextFieldHeight,
                );
              } else {
                return Text("err");
              }
            },
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final updateProfile = <String, String>{};

    _controllers.forEach((key, controller) {
      final currentValue = controller.text;
      final initialValue = _initialValues[key];

      if (currentValue != initialValue) {
        updateProfile[key] = currentValue;
      }
    });
    print(updateProfile);
  }
}
