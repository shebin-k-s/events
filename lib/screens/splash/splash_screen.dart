import 'package:events/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    enterApp(context);
    return Scaffold(
      body: Column(
        children: [

          Spacer(),
          Image.asset('assets/images/logo.jpg'),
          Spacer(),
          LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.purple,
                      size: 50,
                    ),
          SizedBox(height: 50,width: double.infinity,),
        ],
      ),
    );
  }

  enterApp(BuildContext context) async {

      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
      );
    }
}
