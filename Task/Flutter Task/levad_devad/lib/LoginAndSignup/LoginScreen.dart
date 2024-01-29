import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage/HomePage.dart';
import 'Signup.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Number = TextEditingController();
  TextEditingController Password = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  var isLoading = false;


  @override
  void initState()
  {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login()async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false)
    {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  Widget build(BuildContext context)
  {
    return Scaffold
      (
      // backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Form
            (
            key: _formKey,
              child: Column
                (
                  children:
                  [
                    SizedBox(height: 150),

                    Text("Wel-Come",
                    style: TextStyle
                      (
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),

                    Text("To Levad Devad",
                      style: TextStyle
                        (
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),

                    SizedBox(height: 150),


                    Container(

                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),

                      width: 350,
                      height: 60,

                      child: TextFormField
                        (
                        controller: Number,
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                        decoration: InputDecoration
                          (
                          border: OutlineInputBorder
                            (
                            borderRadius: BorderRadius.circular(100),
                          ),
                          prefixIcon: Icon(Icons.phone, color: Colors.white70),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: "Phone Number",
                          fillColor: Colors.green,
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
                        controller: Password,
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        obscureText: true,
                        keyboardType: TextInputType.text, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                        decoration: InputDecoration
                          (
                          border: OutlineInputBorder
                            (
                            borderRadius: BorderRadius.circular(100),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.white70),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: "Password",
                          fillColor: Colors.green,
                        ),
                      ),
                    ),


// Text Button For Forgot PassWord
                    TextButton(onPressed: ()
                    {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                    },
                        child: Text('Forgot Password.?', style: TextStyle(color: Colors.green, fontSize: 18),)),

                    ElevatedButton
                      (
                        style: ButtonStyle
                          (
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
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
                              "https://nikhil2293.000webhostapp.com/API/levadlogin.php");

                          var response = await http.post(url, body:
                          {
                            "Number": Number.text.toString(),
                            "Password": Password.text.toString(),
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
                                backgroundColor: Colors.green,
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
                                backgroundColor: Colors.green,
                              ),
                            );
                            logindata.setBool('login', false);
                            logindata.setString('Number',Number.text.toString());

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                          }
                        },
                        child: Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

                    Container(
                      Ali

                      child: Row
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
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                          },
                              child: Text
                                (
                                "Sign Up",
                                style: TextStyle
                                  (
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 20
                                ),)),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
        ),
      );
  }
}
