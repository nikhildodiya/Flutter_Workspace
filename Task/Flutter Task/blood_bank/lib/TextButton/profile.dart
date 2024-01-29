import 'package:flutter/material.dart';

class Profile extends StatefulWidget
{
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text('Profile'),
        backgroundColor: Colors.red,
      ),

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
                        backgroundColor: Colors.white70,
                        backgroundImage: AssetImage('images/donate.png'),
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
