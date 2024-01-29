import 'dart:async';
import 'package:chatter/LoginSignupeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreenpage extends StatefulWidget
{
  @override
  SplashState createState() => SplashState();
}
class SplashState extends State<Splashscreenpage>
{

  @override
  void initState()
  {
    Timer( Duration(seconds: 5), () =>
        Navigator.push(context,MaterialPageRoute(builder: (context) => LoginSignUpScreen()))
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
                "images/Anima.json",
                height: 300.0,
                repeat: true,
                reverse: true,
                animate: true
            ),
            SizedBox(height: 100),

            Text("Develope By Nikhil Dodiya❤",
              style: TextStyle
                (
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
                ),
          ],
        ),
      ),
    );
  }
}