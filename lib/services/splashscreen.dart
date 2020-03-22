import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:aarvi_textiles/Screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomSplash(
        imagePath: 'assets/icon/icon.png',
        animationEffect: 'zoom-in',
        logoSize: 200,
        duration: 2500,
        type: CustomSplashType.StaticDuration,
        home: Loginscreen() 
      ),
    );
  }
}