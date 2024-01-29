// forgot_password.dart
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget
{
  TextEditingController Email = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar
          (
            title: Text('Forgot Password'),
            backgroundColor: Colors.redAccent,
          ),

        body: SingleChildScrollView
          (
          child: Center
            (
                child: Column
                  (
                    children:
                    [
                      Image.asset("images/forgot.png", height: 350, width: 200,),

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
                            fillColor: Colors.redAccent,
                          ),
                        ),
                      ),

                      ElevatedButton
                        (
                          style: ButtonStyle
                            (
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
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

                          },
                          child: Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                    ],
                  ),
            ),
        ),
    );
  }
}