import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'LoginAndSignup/LoginScreen.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    Timer( Duration(seconds: 5), () =>
        Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()))
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.green,
      body: Center(

        child: Column(

          children: [

            SizedBox(width: 300,height: 300),

            Lottie.asset
              (
                "assets/levad.json",
                height: 300.0,
                repeat: true,
                reverse: true,
                animate: true
            ),
            SizedBox(height: 100),

            Text("Develope By",
              style: TextStyle
                (
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Text("Nikhil Dodiya",
              style: TextStyle
                (
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
