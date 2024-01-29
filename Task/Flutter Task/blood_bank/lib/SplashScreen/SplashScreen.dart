import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../DashBoard/homepage.dart';
import '../LoginAndRegistration/Login.dart';

class SplashScreen  extends StatefulWidget
{
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen>
{

  @override
  void initState()
  {
    Timer( Duration(seconds: 3), () =>
        Navigator.push(context,MaterialPageRoute(builder: (context) => Login()))
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (

      body: Center(

        child: Column(

          children: [

            SizedBox(width: 300,height: 300),

            Lottie.asset
              (
                "images/blood.json",
                height: 300.0,
                repeat: true,
                reverse: true,
                animate: true
            ),
            SizedBox(height: 100),

            Text("Develope By Nikhil Dodiya",
              style: TextStyle
                (
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}