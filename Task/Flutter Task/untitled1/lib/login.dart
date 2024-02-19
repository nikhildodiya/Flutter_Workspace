import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu.dart';


class mylogin extends StatelessWidget
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
  final _formKey = GlobalKey<FormState>();
  late String uname, pass;
  late SharedPreferences Logindata;
  late bool newuser;
  bool isLoading = false;

  @override
  void initState()
  {
    check_if_already_login();

  }
  @override
  Widget build(BuildContext context)
  {
    return Form
      (
        key: _formKey,
        child: Column
          (
          crossAxisAlignment: CrossAxisAlignment.start,

          children:
          [

            SizedBox(width: 200,height: 200),

            TextFormField(

              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Your Email",
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value)
              {

              },
              validator: (value)
              {
                uname = value!;
                if (value.isEmpty ||
                    !RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Enter a valid email!';
                }
                return null;
              },

            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),


            TextFormField(

              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Your Password",
                labelText: 'password',
              ),

              keyboardType: TextInputType.text,
              obscureText: true,
              onFieldSubmitted: (value)
              {

              },

              validator: (value)
              {
                pass = value!;
                if (value.isEmpty)
                {
                  return 'Please enter Password';
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
    final isValid = _formKey.currentState!.validate();

    if(!isValid)
      {
        return;
      }
    else
      {
        _formKey.currentState!.save();
        String username = uname;
        String password = pass;

        if(username != "" && password != "")
          {
            print('Success');
            Logindata.setBool('Login', false);
            Logindata.setString('username', username);
            Navigator.push(context,MaterialPageRoute(builder: (context) => MenuEx()));
          }

      }
}

  void check_if_already_login() async
  {
    Logindata = await SharedPreferences.getInstance();
    newuser = (Logindata.getBool('login') ?? true);
    print(newuser);
    if ( newuser == false)
      {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => MenuEx()));
      }
  }
}