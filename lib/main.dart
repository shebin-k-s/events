import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/application/profile/profile_bloc.dart';
import 'package:events/screens/edit_profile/edit_profile_screen.dart';
import 'package:events/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: SplashScreen(),
        // home: SplashScreen(),

      ),
    );
  }
}
