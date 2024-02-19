import 'package:registration_form/first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreenPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    FlutterNativeSplash.preserve();

    return SplashScreen
      (
        seconds: 10,
        navigateAfterSeconds: new FirstPage(),
        image: Image.asset("assets/abc.png"),
        photoSize: 150.0,
        backgroundColor: Colors.black,
        loaderColor: Colors.red
      );
  }
}