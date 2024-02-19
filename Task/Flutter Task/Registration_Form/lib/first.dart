import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget
{
  @override
  FirstState createState() => FirstState();

}
class FirstState extends State<FirstPage>
{

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    return Form(
        key: _formKey,
        child: Column
          (
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [

            TextFormField(

              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Your Firstname",
                labelText: 'Firstname',
              ),
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return 'Please enter firstname';
                }
                return null;
              },
            ),



            TextFormField(

              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Your LastName",
                labelText: 'Lastname',
              ),
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return 'Please enter Lastname';
                }
                return null;
              },
            ),



            TextFormField(

              decoration: const InputDecoration(
                icon: const Icon(Icons.email)
                    hintText: "Enter Your Email",
                labelText: "Email",
              ),
              validator: (value)
              {
                if(value.isEmpty)
              {
                return "Please Enter Email"
              }
                return null,
              },
            ),


            TextFormField(

              decoration: const InputDecoration
                (
                icon: const Icon(Icons.password),
                hintText: "Enter Your Password",
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value)
              {
                if (value.isEmpty)
                {
                  return 'Please enter Password';
                }
                return null;
              },
            ),

            TextFormField(

            decoration: const InputDecoration(
             icon: const Icon(Icons.password),
             hintText: "Confirm Your PassWord";
             labelText: 'Confirm Password'
            )

            )










            ElevatedButton(onPressed: ()
            {
              if(_formKey.currentState!.validate())
              {
                print("Data Processing");
              }
            },
                child: Text("Login")
            )
          ],


        ));
  }
}