import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage/HomePage.dart';
import 'LoginAndSignup/Login.dart';


class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  late SharedPreferences logindata;
  late bool newuser;
  var isLoading = false;

  @override
  void initState()
  {
    check_if_already_login();
    Timer
      (
        Duration(seconds: 3), () =>
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Login()))
      );
  }

  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false)
    {
      Navigator.pushReplacement
        (
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(

          child: Column(

            children: [

              SizedBox(width: 300,height: 300),

              Lottie.asset
                (
                  "assets/splash.png",
                  height: 200.0,
                  repeat: true,
                  reverse: true,
                  animate: true
              ),
              SizedBox(height: 250),

              Text("Develope By",
                style: TextStyle
                  (
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

              Text("Nikhil Dodiya",
                style: TextStyle
                  (
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}