// Q56. Write a program to show four images around Textview.

import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Image With Text"),),
      body: ImageWithText(),
    );
  }

}

class ImageWithText extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://nikhil2293.000webhostapp.com/Images/android.jpg",
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://nikhil2293.000webhostapp.com/Images/java.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Hello Technologies',
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://nikhil2293.000webhostapp.com/Images/linux.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://nikhil2293.000webhostapp.com/Images/my.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ],
        ),

      ],

    );

  }
}