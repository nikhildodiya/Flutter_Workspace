import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';

class SignUp extends StatefulWidget
{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();

  bool _passwordVisible = false;
  bool _ConpasswordVisible = false;

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
      backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form
            (
           key: _formKey,
            child: Center
              (
                child: Column
                  (

                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                    [
                      SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text
                        (
                          "Register",
                          style: TextStyle
                            (
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                        ),
                      ),

                      SizedBox(height: 100),


                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),

                        width: 370,
                        height: 60,

                        child: TextFormField(
                          controller: Name,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration
                            (
                            border: OutlineInputBorder
                              (
                                borderSide: BorderSide
                                  (
                                color: Colors.white, // Change border color when focused
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            labelText: "Full Name",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Enter Your Full Name",
                            hintStyle: TextStyle(color: Colors.white),
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

                      SizedBox(height: 8),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),

                        width: 370,
                        height: 60,
                        child: TextFormField
                          (
                          controller: Number,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration
                            (
                            border: OutlineInputBorder
                              (
                              borderSide: BorderSide
                                (
                                color: Colors.white, // Change border color when focused
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.white),
                            labelText: "Mobile Number",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Enter Your Mobile Number",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value)
                          {
                            if (value == null || value.isEmpty || value.length != 10)
                            {
                              return 'Please enter Valid Mobile number';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 8),


                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),

                        width: 370,
                        height: 60,

                        child: TextFormField
                          (
                          controller: Email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration
                            (
                            border: OutlineInputBorder
                              (
                              borderSide: BorderSide
                                (
                                color: Colors.white, // Change border color when focused
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                            labelText: "Email Address",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Enter Your Email Address",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                            {
                              return 'Please enter Email';
                            }
                            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(value))
                            {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 8),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),

                        width: 370,
                        height: 60,

                        child: TextFormField
                          (
                          controller: Password,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration
                            (
                            border: OutlineInputBorder
                              (
                              borderSide: BorderSide
                                (
                                color: Colors.white, // Change border color when focused
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(Icons.password_outlined, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon
                                (_ConpasswordVisible ? Icons.visibility
                                  : Icons.visibility_off,
                              ),
                              onPressed: ()
                              {
                                setState(()
                                {
                                  _ConpasswordVisible = !_ConpasswordVisible;
                                });
                              },
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Enter Your Password",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (passcurrentvalue)
                          {
                            RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            var passnonnullvalue = passcurrentvalue??"";
                            if(passnonnullvalue.isEmpty)
                            {
                              return ("password is required");
                            }
                            else if(passnonnullvalue.length<6)
                            {
                              return ("password must be more than 5 characters");
                            }
                            else if(!regex.hasMatch(passnonnullvalue))
                            {
                              return ("password should contain upper,lower,digit and special character ");
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 8),

                      Container(

                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),

                        width: 370,
                        height: 60,
                        child: TextFormField
                          (
                          controller: Confirmpassword,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration
                            (
                            border: OutlineInputBorder
                              (
                              borderSide: BorderSide
                                (
                                color: Colors.white, // Change border color when focused
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(Icons.password_rounded, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon
                                (_passwordVisible ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: ()
                              {
                                setState(()
                                {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Enter Your Confirm Password",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value)
                          {
                            if (value == null || value.isEmpty)
                            {
                              return 'Please enter your Confirm Password';
                            }
                            else if (value != Password.text)
                            {
                              return 'Password Dont Match';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 8),

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
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
                            var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlerregistration.php");
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
                        child: Text("Sign Up",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                      ),

                      SizedBox(height: 10),

                      Container(
                        alignment: Alignment.center,
                        child: Row
                          (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text("If You Have Account.??",
                              style: TextStyle
                                (
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),

                            TextButton(onPressed: ()
                            {
                              Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context)=>Login()));
                            }, child: Text("Sign In",
                              style: TextStyle
                                (
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                            ),
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
