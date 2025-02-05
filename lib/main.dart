import 'package:flutter/material.dart';
import 'package:template_project/screens/Splash_Screen.dart';
import 'package:template_project/screens/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signin': (context) => SigninScreens(),
        //'/signup': (context) => Signupscreens(),
      },
    );
  }
}
