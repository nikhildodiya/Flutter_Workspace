import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'SignupPage.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget
{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<MyApp>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  var isLoading = false;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    //4
    check_if_already_login();
  }

    void check_if_already_login()async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false)
    {
      Navigator.pushReplacement
        (context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Login Screen"),),
      body: SingleChildScrollView(
        child: Form
          (
          key: _formKey,
          child: Center(
            child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Container
                  (
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                  width: 350,
                  height: 60,

                  child: TextFormField
                    (
                    controller: email,
                    validator: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder
                        (
                        borderRadius: BorderRadius.circular(100),
                      ),
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                      hintText: "Email Address",
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                Container
                  (
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(5.0),

                  width: 350,
                  height: 60,

                  child: TextFormField
                    (
                    controller: password,
                    validator: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder
                        (
                        borderRadius: BorderRadius.circular(100),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                      hintText: "Password",
                      fillColor: Colors.white,
                    ),
                  ),
                ),


// Elevated Button For SignIn
                ElevatedButton
                  (
                    style: ButtonStyle
                      (
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                    onPressed: () async
                    {
                      var url = Uri.parse(
                          "https://nikhil2293.000webhostapp.com/API/asseslogin.php");

                      var response = await http.post(url, body:
                      {
                        "email": email.text.toString(),
                        "password": password.text.toString(),
                      });
                      var data = json.decode(response.body);
                      if (data == 0)
                      {
                        ScaffoldMessenger.of(context).showSnackBar
                          (
                          SnackBar
                            (
                            content: Text
                              (
                              'Please Enter Correct Phone Or Password',
                              style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold ),
                            ),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar
                          (
                          SnackBar
                            (
                            content: Text
                              (
                              'You Are Welcome',
                              style: TextStyle
                                (color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.blue,
                          ),
                        );
                        logindata.setBool('login', false);
                        logindata.setString('email',email.text.toString());

                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      }
                    },
                    child: Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

                Row
                  (
                  children:
                  [
                    Text("You Don't Have Account.??",
                      style: TextStyle
                        (
                          fontSize: 18,
                        ),
                    ),

                    TextButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                    },
                        child: Text
                          (
                          "Sign Up",
                          style: TextStyle
                            (
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}