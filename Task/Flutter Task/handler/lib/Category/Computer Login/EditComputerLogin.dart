import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:handler/Category/Business/ViewBusiness.dart';
import 'package:http/http.dart' as http;
import 'ViewComputerLogin.dart';


class EditComputerLogin extends StatefulWidget
{
  late final Map<String, dynamic> data;
  EditComputerLogin({required this.data});

  @override
  _EditComputerLoginState createState() => _EditComputerLoginState();
}

class _EditComputerLoginState extends State<EditComputerLogin>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController computer_name = TextEditingController();
  TextEditingController computer_ip = TextEditingController();
  TextEditingController computer_username = TextEditingController();
  TextEditingController computer_password = TextEditingController();
  TextEditingController computer_email = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    computer_name.text = widget.data['computer_name'];
    computer_ip.text = widget.data['computer_ip'];
    computer_username.text = widget.data['computer_username'];
    computer_password.text = widget.data['computer_password'];
    computer_email.text = widget.data['computer_email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Update Computer Details"),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
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

              SizedBox(height: 20),

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
                    var url = Uri.parse(
                        "https://nikhil2293.000webhostapp.com/API/Handler/handlercomputerupdate.php");
                    var response = await http.post(url, body:
                    {
                      "Id": widget.data['Id'],
                      "computer_name": computer_name.text.toString(),
                      "computer_ip": computer_ip.text.toString(),
                      "computer_username": computer_username.text.toString(),
                      "computer_password": computer_password.text.toString(),
                      "computer_email": computer_email.text.toString(),
                    });

                    if (response.statusCode == 200)
                    {
                      // Update successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Details updated successfully",
                              style: TextStyle(color: Colors.white)),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ComputerLoginView()));
                    } else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text
                            (
                              "Details update failed. Please try again.",
                              style: TextStyle(color: Colors.white)
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Update Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> fetchData() async
  {
    var url = Uri.parse
      ("https://nikhil2293.000webhostapp.com/API/Handler/handlercomputerupdate.php");
    var response = await http.post(url, body:
    {
      "Id": widget.data['Id'],
    });

    if (response.statusCode == 200)
    {
      return Map<String, dynamic>.from(json.decode(response.body));
    }
    else
    {
      return null;
    }
  }
}