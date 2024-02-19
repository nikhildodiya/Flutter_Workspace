import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAnimation extends StatefulWidget
{
  @override
  AnimationState createState() => AnimationState();
}

class AnimationState extends State<MyAnimation>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: Center(

        child: Column(

          children: [

            SizedBox(width: 50, height: 50,),

            Lottie.network("https://nikhil2293.000webhostapp.com/Images/animation.json",
            height: 200,
              repeat: true,
              reverse: true,
              animate: true
            )
            ],
            )

        ),
      );

  }
}
