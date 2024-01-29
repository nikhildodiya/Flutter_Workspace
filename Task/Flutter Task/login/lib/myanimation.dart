import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Login.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';

class MyAnimation extends StatefulWidget
{  @override
MyState createState() => MyState();
}

class MyState extends State<MyAnimation>
{
  @override

  void initState()
  {
    Timer
      (
        Duration (seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => Mylogin2()))
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(

        child: Column(

          children: [

            Lottie.network
              ("https://nikhil2293.000webhostapp.com/Images/lottie.json",
                height: 500.0,
                repeat: true,
                reverse: true,
                animate: true
            )
          ],
        ),
      ),

    );
  }
}