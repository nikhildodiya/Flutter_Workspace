import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menufile.dart';

class xyz extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: login(),
    );
  }

}
class login extends StatefulWidget
{
  @override
  loginState createState() => loginState();
}

class loginState extends State<login>
{
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    return Form
      (
      key: formKey,
      child: Column
        (
        crossAxisAlignment: CrossAxisAlignment.start,

        children:
        [

          SizedBox(width: 200,height: 200),

          TextFormField(

            decoration: const InputDecoration
              (
                  icon: const Icon(Icons.email),
              hintText: "Enter Your Email",
              labelText: 'Email',
              ),
            validator: (value)
            {
              if(value!.isEmpty)
                {
                  return "Please Enter Your Email";
                }
              return null;
            },
          ),

          TextFormField
            (
            decoration: const InputDecoration
              (
              icon: const Icon(Icons.password),
              hintText: "Enter Your Password",
              labelText: 'Password',
            ),
            obscureText: true,

            validator: (value)
                  {
                    if(value!.isEmpty)
                  {
                    return "Please Enter Your Email";
                  }
                    return null;
                  },
          ),

            SizedBox(width: 20, height: 20),

          ElevatedButton(onPressed: ()
              {
                submit();
              }, child: Text("Login")),
        ],
      )
    );

  }

  void submit()
  {
    Timer
      (
        Duration (seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (Context) => Menu()))
      );
  }
}