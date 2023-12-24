import 'dart:convert';
import 'package:flutter/material.dart';

import 'ChatPage.dart';
import 'LoginScreen.dart';
import 'SignUp.dart';


class LoginSignUpScreen extends StatefulWidget
{
  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        // backgroundColor: Colors.white60,
        body: Center
          (
          child: Column
            (
/*
            crossAxisAlignment: CrossAxisAlignment.center,
*/
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            [
              SizedBox(height: 100),
              Image.asset("images/msg.jpeg", height: 150, width: 150),

              Text
              (
                "Chatter",
                style: TextStyle
                (fontSize: 24,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text
                (
                "WORLD'S MOST PRIVATE CHATTING APP",
                style: TextStyle
                  (fontSize: 12,
                    color: Colors.purple,
                  ),
              ),

              SizedBox(height: 100),

              ElevatedButton(
                  style: ButtonStyle
                    (
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: MaterialStateProperty.all(Size(250, 50)),
                    elevation: MaterialStateProperty.all(4.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>
                      (
                        RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                      ),
                  ),
                  onPressed: ()
                  {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Login", style: TextStyle(color: Colors.deepPurple),)
                  ),

              SizedBox(height: 15),

              ElevatedButton(
                  style: ButtonStyle
                    (
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    minimumSize: MaterialStateProperty.all(Size(250, 50)),
                    elevation: MaterialStateProperty.all(4.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>
                      (
                      RoundedRectangleBorder
                        (
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                    ),
                  ),
                  onPressed: ()
                  {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white),)
              ),


              SizedBox(height: 200),
              Text
                ("Devlope By Nikhil Dodiya🤎",
                  style: TextStyle
                  (
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold
                  ),
                 )
            ],
          ),
        ),
      );
  }
}
