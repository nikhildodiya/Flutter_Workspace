import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handler/HomePage/HomePage.dart';
import 'package:http/http.dart' as http;

import 'ViewBusiness.dart';


class Business extends StatefulWidget
{
  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Business_Name = TextEditingController();
  TextEditingController Person_Name = TextEditingController();
  TextEditingController Contact_Pesron = TextEditingController();
  TextEditingController Business_Address = TextEditingController();
  TextEditingController Email_Address = TextEditingController();

  void _cleartext()
  {
    Business_Name.clear();
    Person_Name.clear();
    Contact_Pesron.clear();
    Business_Address.clear();
    Email_Address.clear();
  }

    @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.black,
        appBar:  AppBar(title: Text("Business", style: GoogleFonts.abel
          (
            fontWeight: FontWeight.bold
          ),
        ),
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
                      controller: Business_Name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.person),
                        hintText: "Business Name",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Business Name';
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
                      controller: Person_Name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.person),
                        hintText: "Person Name",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Business Person Name';
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
                      controller: Contact_Pesron,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        hintText: "Contact Number",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Contact Number';
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
                      controller: Business_Address,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.location_city),
                        hintText: "Business Address",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please Enter Valid Business Address';
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
                      controller: Email_Address,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email Address",
                      ),
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
                    ),
                  ),


                  /*Container
                    (
                      child: Row
                        (
                          children: 
                          [
                            Expanded(child: Text
                              (
                                "Upload Visiting Card:",
                              style: TextStyle
                              (
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                              ),
                            ),

                            Expanded
                              (
                                child: ElevatedButton
                                  (
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white10), // Background color
                                      side: MaterialStateProperty.all<BorderSide>
                                      (
                                        BorderSide(color: Colors.grey), // Border color and width
                                      ),
                                      minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                                      elevation: MaterialStateProperty.all<double>(4.0),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder
                                        (
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: ()
                                {

                                },
                                    child: Row
                                      (
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:
                                        [
                                          Icon(Icons.add_a_photo),
                                          SizedBox(width: 6),
                                          Text("Upload Image"),
                                            ],
                                      ),)
                              )
                          ],
                        ),
                    ),*/

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
                        var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlerbusiness.php");
                        var response = await http.post(url,
                            body:
                            {
                              "Business_Name":Business_Name.text,
                              "Person_Name":Person_Name.text,
                              "Contact_Person":Contact_Pesron.text,
                              "Business_Address":Business_Address.text,
                              "Email_Address":Email_Address.text,
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
                          _cleartext();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BusinessView()));
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
