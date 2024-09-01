import 'package:flutter/material.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/screens/widgets/custom_elevated_button.dart';
import 'package:events/screens/widgets/custom_text_formfield.dart';

class EditProfileScreen extends StatelessWidget {
  final String userType;

  EditProfileScreen({super.key, required this.userType});

  final _formKey = GlobalKey<FormState>();

  late final Map<String, TextEditingController> _controllers;

  Map<String, TextEditingController> _initControllers() {
    final commonFields = {
      'firstName': 'First Name',
      'lastName': 'Last Name',
      'email': 'Email',
      'contactNo': 'Contact No',
      'whatsappNo': 'Whatsapp No',
      'purpose': 'Purpose',
    };

    final studentFields = {
      'college': 'College',
      'university': 'University',
      'deptName': 'Department Name',
      'clgRegNo': 'College Registration No',
      'clgIdPic': 'College ID Pic',
    };

    final employeeFields = {
      'companyName': 'Company Name',
      'companyLocation': 'Company Location',
      'companyId': 'Company ID',
    };

    final fields = {
      ...commonFields,
      ...userType == 'student'
          ? studentFields
          : userType == 'employee'
              ? employeeFields
              : {},
    };

    return fields.map((key, value) => MapEntry(key, TextEditingController()));
  }

  @override
  Widget build(BuildContext context) {
    _controllers = _initControllers();
    
    final controllerEntries = _controllers.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView.separated(
              itemBuilder: (context, index) {                
                if (index < _controllers.length) {
                  final entry = controllerEntries[index];
                  return CustomTextFormField(
                    textController: entry.value,
                    labelText: entry.key,
                    errorText: 'Please enter ${entry.key}',
                  );
                } else {
                  return CustomElevatedButton(
                    height: 50,
                    width: 200,
                    onPressed: () {},
                    backgroundColor: Colors.blue,
                    label: "Save Changes",
                    labelColor: Colors.white,
                    labelSize: 16,
                  );
                }
              },
              separatorBuilder: (context, index) => kTextFieldHeight,
              itemCount: _controllers.length + 1,
            ),
          ),
        ),
      ),
    );
  }
}
