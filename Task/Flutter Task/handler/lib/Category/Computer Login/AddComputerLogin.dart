import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handler/Category/Computer%20Login/ViewComputerLogin.dart';
import 'package:handler/HomePage/HomePage.dart';
import 'package:http/http.dart' as http;


class AddComputerLogin extends StatefulWidget
{
  @override
  _AddComputerLoginState createState() => _AddComputerLoginState();
}

class _AddComputerLoginState extends State<AddComputerLogin>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController computer_name = TextEditingController();
  TextEditingController computer_ip = TextEditingController();
  TextEditingController computer_username = TextEditingController();
  TextEditingController computer_password = TextEditingController();
  TextEditingController computer_email = TextEditingController();

  void _cleartext()
  {
    computer_name.clear();
    computer_ip.clear();
    computer_username.clear();
    computer_password.clear();
    computer_email.clear();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.black,
      appBar:  AppBar(title: Text("Business", style: GoogleFonts.abel
        (
          fontWeight: FontWeight.bold
      ),
      ),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Center
          (
          child: Column
            (
            children:
            [
              Container
                (
                padding: EdgeInsets.all(8.0),
                child: TextFormField
                  (
                  controller: computer_name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    prefixIcon: Icon(Icons.computer),
                    hintText: "Computer Name",
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid Computer Name';
                    }
                    return null;
                  },
                ),
              ),

              Container
                (
                padding: EdgeInsets.all(8.0),
                child: TextFormField
                  (
                  controller: computer_ip,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration
                    (
                    prefixIcon: Icon(Icons.location_disabled),
                    hintText: "IP Address",
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid IP address';
                    }
                    return null;
                  },
                ),
              ),

              Container
                (
                padding: EdgeInsets.all(8.0),
                child: TextFormField
                  (
                  controller: computer_username,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                    hintText: "UserName",
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid User Name';
                    }
                    return null;
                  },
                ),
              ),

              Container
                (
                padding: EdgeInsets.all(8.0),
                child: TextFormField
                  (
                  controller: computer_password,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    prefixIcon: Icon(Icons.password),
                    hintText: "Password",
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid Password';
                    }
                    return null;
                  },
                ),
              ),

              Container
                (
                padding: EdgeInsets.all(8.0),
                child: TextFormField
                  (
                  controller: computer_email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration
                    (
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email Address",
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value))
                    {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),


              SizedBox(height: 10),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                  side: MaterialStateProperty.all<BorderSide>
                    (
                    BorderSide(color: Colors.grey), // Border color and width
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                  elevation: MaterialStateProperty.all<double>(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () async
                {
                  if (_formKey.currentState?.validate() ?? false)
                  {
                    var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlercomputerlogin.php");
                    var response = await http.post(url,
                        body:
                        {
                          "computer_name":computer_name.text,
                          "computer_ip":computer_ip.text,
                          "computer_username":computer_username.text,
                          "computer_password":computer_password.text,
                          "computer_email":computer_email.text,
                        });

                    if (response.statusCode == 200)
                    {
                      // Registration successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Details Added successful", style: TextStyle(color: Colors.white),),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                      _cleartext();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ComputerLoginView()));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Details Addition failed. Please try again.", style: TextStyle(color: Colors.white),),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                    }
                  }
                },
                child: Text("Save Data",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}