import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the first screen when the button is clicked
            Navigator.pop(context);
          },
          child: Text('Go Back to First Screen'),
        ),
      ),
    );
  }
}