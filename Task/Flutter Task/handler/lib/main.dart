import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage/HomePage.dart';
import 'LoginAndSignup/Login.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  late SharedPreferences logindata;
  late bool newuser;
  var isLoading = false;

  TextEditingController Number = TextEditingController();


  void initState()
  {
    super.initState();
    checkConnection();
    check_if_already_login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi)
    {
      Timer
        (
        Duration(seconds: 2),
            () =>
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        ),
      );
    }
    else
    {
      _showConnectionDialog();
    }
  }

  _showConnectionDialog() async
  {
    return showDialog(
      context: context,
     // barrierDismissible: false,
      builder: (BuildContext context)
      {
        return AlertDialog(
          backgroundColor: Colors.black26,
          title: Row(
            children: [
              Icon(Icons.error),
              Text("\tNetwork Error"),
            ],
          ),
          content: Text
          (
            'Please check your internet connection.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          actions: <Widget>
          [
            ElevatedButton
              (
              style: ElevatedButton.styleFrom
                (
                primary: Colors.white,
              ),
              onPressed: () {
                exit(0);
              },
              child: Text("Exit", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
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
}