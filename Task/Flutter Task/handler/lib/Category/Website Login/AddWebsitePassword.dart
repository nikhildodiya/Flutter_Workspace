import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ViewWebsitePassword.dart';


class Website extends StatefulWidget
{
  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Website_Name = TextEditingController();
  TextEditingController Website_Link = TextEditingController();
  TextEditingController Website_UserName = TextEditingController();
  TextEditingController Website_UserId = TextEditingController();
  TextEditingController Website_Password = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text("Website Password"),
        backgroundColor: Colors.black,
        ),
      body: Form(
        key: _formKey,
        child: Center
          (
            child: Column
              (
                children:
                [
                  Container
                    (
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField
                      (
                      controller: Website_Name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.browser_not_supported),
                        hintText: "Website Name",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Website Name';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container
                    (
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField
                      (
                      controller: Website_Link,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.link),
                        hintText: "Website Link",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Website Link';
                        }
                        return null;
                      },
                    ),
                  ),


                  Container
                    (
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField
                      (
                      controller: Website_UserName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "Email",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container
                    (
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField
                      (
                      controller: Website_UserId,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.perm_identity),
                        hintText: "Username",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Username';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container
                    (
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField
                      (
                      controller: Website_Password,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.password),
                        hintText: "Website Password",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Password';
                        }
                        return null;
                      },
                    ),
                  ),


                  SizedBox(height: 10),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                      side: MaterialStateProperty.all<BorderSide>
                        (
                        BorderSide(color: Colors.grey), // Border color and width
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                      elevation: MaterialStateProperty.all<double>(4.0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () async
                    {
                      if (_formKey.currentState?.validate() ?? false)
                      {
                        var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlerwebsitepassword.php");
                        var response = await http.post(url,
                            body: {
                              "Website_Name": Website_Name.text.toString(),
                              "Website_Link": Website_Link.text.toString(),
                              "Usernam_Or_Email": Website_UserName.text.toString(),
                              "Website_UserID": Website_UserId.text.toString(),
                              "Website_Password": Website_Password.text.toString(),
                            });


                        if (response.statusCode == 200)
                        {
                          // Registration successful
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Details Added successful", style: TextStyle(color: Colors.white),),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.black,
                            ),
                          );
                          //  _cleartext();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebsitePasswordView()));
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Details Addition failed. Please try again.", style: TextStyle(color: Colors.white),),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.black,
                            ),
                          );
                        }
                      }
                    },
                    child: Text("Save Data",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
          ),
      ),
      );
  }
}
