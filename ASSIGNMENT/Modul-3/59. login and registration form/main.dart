//Q59. Create login and registration form

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(home: Mylogin(),));
}



class Mylogin extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: Login(),

    );
  }

}

class Login extends StatefulWidget
{
  @override
  LoginState  createState()  => LoginState();

}

class LoginState extends State<Login>
{

  final _formKey = GlobalKey<FormState>();
  late String uname,pass;
  late SharedPreferences logindata;

  late bool newuser;
  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
  }

  @override
  Widget build(BuildContext context)
  {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
            ),

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
                if (value!.isEmpty)
                {
                  return 'Please enter Password';
                }
                return null;
              },

            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            ElevatedButton(onPressed: ()
            {
              _submit();
              toastmsg();
            },
                child: Text("Login")
            )
          ],


        ));


  }

  void _submit()
  {

    final isValid = _formKey.currentState?.validate();
    if (!isValid!)
    {
      return;
    }
  }


}
void toastmsg()
{

  Fluttertoast.showToast
    (
      msg: "Welcome",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.yellow
  );
}