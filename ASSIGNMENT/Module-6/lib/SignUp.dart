import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'LoginScreen.dart';

class SignUp extends StatefulWidget
{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;
  bool _ConpasswordVisible = false;

  final _formkey = GlobalKey<FormState>();

  String First_Name = '';
  String Last_Name = '';
  String Email = '';
  String Number = '';
  String Password = '';
  String ConfirmPassword = '';

  var FirstNameController = TextEditingController();
  var LastNameController = TextEditingController();
  var EmailController = TextEditingController();
  var NumberController = TextEditingController();
  var PasswordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();

  _clearText()
  {
    FirstNameController.clear();
    LastNameController.clear();
    EmailController.clear();
    NumberController.clear();
    PasswordController.clear();
    ConfirmPasswordController.clear();
  }

  CollectionReference addUser = FirebaseFirestore.instance.collection('Students');

  Future<void> _registerUser() async
  {
    try {
      await addUser.add
        (
          {
        'First_Name': First_Name,
        'Last_Name': Last_Name,
        'Email': Email,
        'Number': Number,
        'Password': Password,
        'ConfirmPassword': ConfirmPassword,
      });
      print('User Added');
    }
    catch (error)
    {
      print('Error registering user: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset("images/msg.jpeg", height: 150, width: 150),
                Center(
                  child: Text(
                    "Chatter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(12.0),
                  padding: EdgeInsets.all(7.0),
                  width: 300,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: FirstNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      hintText: "Enter First Name",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),
                    validator: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter First name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: LastNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      hintText: "Enter Last Name",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Last name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: EmailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      hintText: "Enter Email",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      if (!RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: NumberController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.phone),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      hintText: "Enter Phone Number",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 10) {
                        return 'Please enter Valid Mobile number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: PasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      hintText: "Enter Password",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),
                    validator: (passcurrentvalue) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[a-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      var passnonnullvalue = passcurrentvalue ?? "";
                      if (passnonnullvalue.isEmpty) {
                        return ("password is required");
                      } else if (passnonnullvalue.length < 6) {
                        return ("password must be more than 5 characters");
                      } else if (!regex.hasMatch(passnonnullvalue)) {
                        return (
                            "password should contain upper,lower,digit and special character ");
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.0),
                  padding: EdgeInsets.all(12.0),
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: ConfirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_ConpasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _ConpasswordVisible = !_ConpasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      hintText: "Confirm Password",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Confirm Password';
                      } else if (value != PasswordController.text) {
                        return 'Password Don\'t Match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
                    minimumSize: MaterialStateProperty.all(Size(250, 50)),
                    elevation: MaterialStateProperty.all(4.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate())
                    {
                      setState(()
                      {
                        First_Name = FirstNameController.text;
                        Last_Name = LastNameController.text;
                        Email = EmailController.text;
                        Number = NumberController.text;
                        Password = PasswordController.text;
                        ConfirmPassword = ConfirmPasswordController.text;
                        _registerUser();
                        _clearText();
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    children: [
                      Text("You Have Already Account please"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
