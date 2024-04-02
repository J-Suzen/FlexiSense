import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'package:flexi_sense_companion/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          // Ensures the container fills the remaining space
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            'assets/images/img_logo.png',
            // Use BoxFit.cover to resize the image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}
