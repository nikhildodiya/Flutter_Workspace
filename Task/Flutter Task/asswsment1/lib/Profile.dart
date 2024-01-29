import 'package:flutter/material.dart';

class Profile extends StatelessWidget
{

  String name, email;

  Profile({required this.name, required this.email});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Profile"),),

      body: Center
        (
           child: Column
             (
              children:
              [
                SizedBox(height: 40),
                CircleAvatar
                  (
                  radius: 100.0,
                 // backgroundColor: Colors.white70,
                  backgroundImage: AssetImage('image/profile.jpg'),
                ),

                SizedBox(height: 10),
                Text
                  (
                  "Name: Nikhil Dodiya",
                  style: TextStyle
                    (
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
             ),
        ),
      );
  }
}
