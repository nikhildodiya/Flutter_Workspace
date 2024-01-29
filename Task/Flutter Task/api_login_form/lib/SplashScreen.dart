import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Login.dart';
import 'main.dart';


class SplashScreenPage extends StatefulWidget
{

  @override
  SplashState createState() => SplashState();


}
class SplashState extends State<SplashScreenPage>
{

  @override
  void initState()
  {
    Timer( Duration(seconds: 5), () =>
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

            Lottie.network
              (
                "https://nikhil2293.000webhostapp.com/Images/ani.json",
                height: 200.0,
                repeat: true,
                reverse: true,
                animate: true
            ),
          ],
        ),
      ),
    );
  }
}