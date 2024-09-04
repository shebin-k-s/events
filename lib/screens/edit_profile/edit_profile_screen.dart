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
  EditProfileScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String> _initialValues = {};

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(FetchProfileInfoEvent());

    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) => current is ProfileActionState,
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Successfully updated"),
            ),
          );
        } else if(state is UpdateProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Update failed"),
            ),
          );
        }
      },
      child: Scaffold(
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
              buildWhen: (previous, current) => current is !ProfileActionState,
              builder: (context, state) {
                if (state is ProfileInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FetchProfileSuccessState) {
                  final profile = state.profileDataModel;
                  final fields = {
                    'first_name': profile.firstName,
                    'second_name': profile.secondName,
                    'email': profile.email,
                    'purpose': profile.purpose,
                    'college': profile.college,
                    'university': profile.university,
                    'department': profile.deptName,
                    'admission_no': profile.admissionNo,
                    'college_reg_no': profile.clgRegno,
                    'company_name': profile.companyName,
                    'company_id': profile.companyId,
                    'company_location': profile.companyLocation,
                    'country': profile.country.toString(),
                    'state_id': profile.stateId.toString(),
                    'district_id': profile.districtId.toString(),
                    'contact_no': profile.contactNo,
                    'whatsapp_no': profile.whatsappNo,
                  };

                  final nonNullFields = fields.entries
                      .where(
                        (entry) =>
                            entry.value != null && entry.value!.isNotEmpty,
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
                        final label = entry.key
                            .split('_')
                            .map((word) =>
                                word[0].toUpperCase() + word.substring(1))
                            .join(' ');
                        return CustomTextFormField(
                          textController: _controllers[entry.key]!,
                          labelText: label,
                          errorText: 'Please enter the $label',
                          readOnly: label == "First Name" ? true : false,
                        );
                      } else {
                        return CustomElevatedButton(
                          height: 50,
                          width: 70,
                          onPressed: () {
                            _submitForm(context);
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
                  return const Text("err");
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    final updateProfile = <String, String>{};

    _controllers.forEach((key, controller) {
      final currentValue = controller.text;
      final initialValue = _initialValues[key];

      if (currentValue != initialValue) {
        updateProfile[key] = currentValue;
      }
    });

    context.read<ProfileBloc>().add(UpdateProfileEvent(updateProfile));
  }
}
