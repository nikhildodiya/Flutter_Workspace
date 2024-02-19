//Q59. Write a program you have taken three seek bar controls.
// From three Seekbar which Seekbar value changed the background color of device will be changed.

import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double redValue = 0.0;
  double greenValue = 0.0;
  double blueValue = 0.0;

  void _updateBackgroundColor()
  {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(
      redValue.round(),
      greenValue.round(),
      blueValue.round(),
      1.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Background Color Changer'),
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              value: redValue,
              min: 0.0,
              max: 255.0,
              onChanged: (value) {
                redValue = value;
                _updateBackgroundColor();
              },
            ),
            Slider(
              value: greenValue,
              min: 0.0,
              max: 255.0,
              onChanged: (value) {
                greenValue = value;
                _updateBackgroundColor();
              },
            ),
            Slider(
              value: blueValue,
              min: 0.0,
              max: 255.0,
              onChanged: (value) {
                blueValue = value;
                _updateBackgroundColor();
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}