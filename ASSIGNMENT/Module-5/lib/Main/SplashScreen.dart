import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../HomePage.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
          body: Center
            (
               child: Column
                 (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      SizedBox(height: 100,),
                 Lottie.network
                 (
                 "https://nikhil2293.000webhostapp.com/Images/database.json",
                 height: 200.0,
                 repeat: true,
                 reverse: true,
                 animate: true,
                 ),
                    ],
                 ),
            ),
      );
  }
}
