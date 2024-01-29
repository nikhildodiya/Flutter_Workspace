import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'menufile.dart';

class MyAnimation extends StatefulWidget
{
  @override
  MyState createState() => MyState();
}

class MyState extends State<MyAnimation>
{
  @override
  void initState()
  {
    Timer( Duration (seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (Context) => Menu()))
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: Center(

        child: Column(

          children: [

            SizedBox(width: 500, height: 500),

            Lottie.network
              ("https://nikhil2293.000webhostapp.com/Images/loading.json",
              height: 200.0,
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
