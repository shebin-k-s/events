import 'package:events/screens/authentication/login_screen.dart';
import 'package:events/screens/edit_profile/edit_profile_screen.dart';
import 'package:events/screens/profile/profile_screen.dart';
import 'package:events/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      // home: LoginScreen(),
      home: ProfileScreen(),
      // home: EditProfileScreen(),
    );
  }
}
