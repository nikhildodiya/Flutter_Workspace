//73. Write a code to display Splash Screen using Activity

import 'dart:async';

import 'package:a73_splash_screen/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp
      (
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
        Navigator.push(context,MaterialPageRoute(builder: (context) => FirstPage()))
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