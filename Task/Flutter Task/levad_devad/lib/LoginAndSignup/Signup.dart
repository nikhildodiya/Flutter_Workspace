import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';


class SignUp extends StatefulWidget
{
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Number = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();

  void _cleartext()
  {
    Name.clear();
    Email.clear();
    Number.clear();
    Password.clear();
    Confirmpassword.clear();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Registration Form"),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView
        (
        child: Form
          (
          key: _formKey,
          child: Column(
            children:
            [
              Container(

                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: Name,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.white70),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Full Name",
                    fillColor: Colors.green,
                  ),
                ),
              ),

              Container(

                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: Email,
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
                  keyboardType: TextInputType.emailAddress, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.white70),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Email",
                    fillColor: Colors.green,
                  ),
                ),
              ),

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

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),

                width: 350,
                height: 60,

                child: TextFormField
                  (
                  controller: Confirmpassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != Password.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                  obscureText: true,
                  decoration: InputDecoration
                    (
                    labelStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.white70),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                    hintText: "Confirm Password",
                    fillColor: Colors.green,
                  ),


                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  minimumSize: MaterialStateProperty.all(Size(250, 50)),
                  elevation: MaterialStateProperty.all(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder
                      (
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () async
                {
                  if (_formKey.currentState?.validate() ?? false)
                  {
                    var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/levadinsert.php");
                    var response = await http.post(url,
                        body:
                        {
                          "Name": Name.text,
                          "Email": Email.text,
                          "Number": Number.text,
                          "Password": Password.text,
                          "Confirmpassword": Confirmpassword.text,
                        });

                    if (response.statusCode == 200)
                    {
                      // Registration successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Registration successful",
                          style: TextStyle(color: Colors.white),),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      _cleartext();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    }
                    else
                    {
                      // Handle registration failure
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Registration failed. Please try again.",
                          style: TextStyle(color: Colors.green),),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
                child: Text("Sign Up",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              Row
                (
                children:
                [
                  Text("You Have Account Account.??",
                    style: TextStyle
                      (
                        color: Colors.black,
                        fontSize: 18,
                    ),
                  ),

                  TextButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                      child: Text
                        (
                        "Sign In",
                        style: TextStyle
                          (
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 20
                        ),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}