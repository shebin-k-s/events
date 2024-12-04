import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/application/profile/profile_bloc.dart';
import 'package:events/screens/authentication/new_design/login_screen.dart';
import 'package:events/screens/authentication/otp_verification_screen.dart';
import 'package:events/screens/home/home_screen.dart';
import 'package:events/screens/navbar_control/navbar_control_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: Colors.white),
          
            // home: OtpVerificationScreen(contact: ""),
            // home: ProfileScreen(),
            home: NavbarControlScreen(),
            // home: LoginScreen(),
          );
        }
      ),
    );
  }
}
