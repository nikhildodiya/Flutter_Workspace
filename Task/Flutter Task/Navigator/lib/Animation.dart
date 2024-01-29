import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'FirstPage.dart';

class MyAnimation extends StatefulWidget
{
  @override
  AnimationState createState() => AnimationState();
}

class AnimationState extends State<MyAnimation>
{
  @override
  void initState()
  {
    Timer
      (
        Duration(seconds: 8), () => Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()))
      );
  }

  @override
  Widget build(BuildContext context)
  {
        return Scaffold(

          body: Center(

            child: Column(

              children: [

                Lottie.network("https://nikhil2293.000webhostapp.com/Images/loading.json",
                height: 200,
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
