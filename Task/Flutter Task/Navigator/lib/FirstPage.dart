import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget
{
  @override
  FirstState createState() => FirstState();
}

class FirstState extends State<FirstPage>
{
  final _formkey = GlobalKey<FirstState>();

  @override
  Widget build(BuildContext context)
  {
      return Form(
        key: _formkey,
        child: Column
          (
              crossAxisAlignment: CrossAxisAlignment.start,

          children:
          [
          TextFormField
          (
          decoration: const InputDecoration
          (
                 icon: const Icon(Icons.email),
                  hintText: "Enter Your Email",
                  labelText: 'Email',
          ),

          validator: (value)
          {
              if (value!.isEmpty)
              {
                return 'Please enter Email';
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

                  validator: (value)
                  {
                      if (value!.isEmpty)
                      {
                        return 'Please enter PassWord';
                      }
                        return null;
                  },
                )

            ],
          ),

    );
  }
}
