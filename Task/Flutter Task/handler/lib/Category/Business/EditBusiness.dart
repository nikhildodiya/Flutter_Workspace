import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:handler/Category/Business/ViewBusiness.dart';
import 'package:http/http.dart' as http;


class EditBusinessDetails extends StatefulWidget
{
  late final Map<String, dynamic> data;
  EditBusinessDetails({required this.data});

  @override
  _EditBusinessDetailsState createState() => _EditBusinessDetailsState();
}

class _EditBusinessDetailsState extends State<EditBusinessDetails>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Business_Name = TextEditingController();
  TextEditingController Person_Name = TextEditingController();
  TextEditingController Contact_Pesron = TextEditingController();
  TextEditingController Business_Address = TextEditingController();
  TextEditingController Email_Address = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    Business_Name.text = widget.data['Business_Name'];
    Person_Name.text = widget.data['Person_Name'];
    Contact_Pesron.text = widget.data['Contact_Person'];
    Business_Address.text = widget.data['Business_Address'];
    Email_Address.text = widget.data['Email_Address'];
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
        title: Text("Update Business Details"),
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
                        "https://nikhil2293.000webhostapp.com/API/Handler/handlerbusinessupdate.php");
                    var response = await http.post(url, body:
                    {
                      "Id": widget.data['Id'],
                      "Business_Name": Business_Name.text.toString(),
                      "Person_Name": Person_Name.text.toString(),
                      "Contact_Person": Contact_Pesron.text.toString(),
                      "Business_Address": Business_Address.text.toString(),
                      "Email_Address": Email_Address.text.toString(),
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BusinessView()));
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
      ("https://nikhil2293.000webhostapp.com/API/Handler/handlerbusinessview.php");
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
