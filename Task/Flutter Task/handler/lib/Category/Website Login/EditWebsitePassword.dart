import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:handler/Category/Business/ViewBusiness.dart';
import 'package:http/http.dart' as http;

import 'ViewWebsitePassword.dart';


class EditWebsitePassword extends StatefulWidget
{
  late final Map<String, dynamic> data;
  EditWebsitePassword({required this.data});

  @override
  _EditWebsitePasswordState createState() => _EditWebsitePasswordState();
}

class _EditWebsitePasswordState extends State<EditWebsitePassword>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Website_Name = TextEditingController();
  TextEditingController Website_Link = TextEditingController();
  TextEditingController Website_UserName = TextEditingController();
  TextEditingController Website_UserId = TextEditingController();
  TextEditingController Website_Password = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    Website_Name.text = widget.data['Website_Name'];
    Website_Link.text = widget.data['Website_Link'];
    Website_UserName.text = widget.data['Usernam_Or_Email'];
    Website_UserId.text = widget.data['Website_UserID'];
    Website_Password.text = widget.data['Website_Password'];
  }

  /*void _clearText() {
    businessNameController.clear();
    personNameController.clear();
    contactPersonController.clear();
    businessAddressController.clear();
    emailAddressController.clear();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Update Website Password"),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
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
                    hintText: "Username or Email",
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid User Name or Email';
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
                    hintText: "Website UserId",
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid UserID';
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

              SizedBox(height: 20),

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
                    var url = Uri.parse(
                        "https://nikhil2293.000webhostapp.com/API/Handler/handlerwebsitepasswordupdate.php");
                    var response = await http.post(url, body:
                    {
                      "Id": widget.data['Id'],
                      "Website_Name": Website_Name.text.toString(),
                      "Website_Link": Website_Link.text.toString(),
                      "Usernam_Or_Email": Website_UserName.text.toString(),
                      "Website_UserID": Website_UserId.text.toString(),
                      "Website_Password": Website_Password.text.toString(),
                    });

                    if (response.statusCode == 200)
                    {
                      // Update successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Details updated successfully",
                              style: TextStyle(color: Colors.white)),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebsitePasswordView()));
                    } else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text
                            (
                              "Details update failed. Please try again.",
                              style: TextStyle(color: Colors.white)
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Update Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> fetchData() async
  {
    var url = Uri.parse
      ("https://nikhil2293.000webhostapp.com/API/Handler/handlerwebsitepasswordview.php");
    var response = await http.post(url, body:
    {
      "Id": widget.data['Id'],
    });

    if (response.statusCode == 200)
    {
      return Map<String, dynamic>.from(json.decode(response.body));
    }
    else
    {
      return null;
    }
  }
}