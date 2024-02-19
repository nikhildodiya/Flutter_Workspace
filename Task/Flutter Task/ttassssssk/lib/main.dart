import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      home: MyClickableImage(),
    );
  }
}

class MyClickableImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text('Clickable Image'),
        ),
      body: Center
        (
            child: GestureDetector
          (
          onTap: showToast,
          child: Image.network
            (
            "https://nikhil2293.000webhostapp.com/Images/my.png",
            height: 100,
            width: 250,
            ), // Replace with your image path
          ),
      ),
    );
  }

  void showToast()
  {
    Fluttertoast.showToast
      (
      msg: "Image Pressed!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}