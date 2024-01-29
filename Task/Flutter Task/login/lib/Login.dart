import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

class Mylogin2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),

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
    print(newuser);
    if (newuser == false)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuEx()));
    }
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
    else
    {
      _formKey.currentState?.save();
      String username = uname;
      String password = pass;
      if (username != '' && password != '')
      {
        print('success');
        logindata.setBool('login', false);
        logindata.setString('username', username);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      }


    }
  }
}