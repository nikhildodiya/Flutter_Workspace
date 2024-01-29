import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../DashBoard/homepage.dart';


class AddDonor extends StatefulWidget
{
  @override
  State<AddDonor> createState() => _AddDonorState();
}

class _AddDonorState extends State<AddDonor>
{

  final _formKey = GlobalKey<FormState>();

  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Gender = TextEditingController();
  TextEditingController Blood_Group = TextEditingController();
  TextEditingController Any_Disease = TextEditingController();
  TextEditingController Describe = TextEditingController();
  TextEditingController Home_Address = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Add Donor"),backgroundColor: Colors.redAccent,),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView
          (
            child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [

// TextFeild For Name
                  Container(

                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (
                      controller: Name,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Full Name",
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),

// TextFeild For Number
                  Container(

                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (
                      controller: Number,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIcon: Icon(Icons.phone, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Phone Number",
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),

// TextFeild For Email
                  Container(

                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (
                      controller: Email,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Email Address",
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),

                  /*Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),
                    width: 350,
                    height: 60,
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                              Gender.text = value ?? ''; // Update the text field
                            });
                          },
                        ),
                        Text('Male'),


                        SizedBox(width: 5),
                        Radio<String>(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value)
                          {
                            setState(() {
                              selectedGender = value;
                              Gender.text = value ?? ''; // Update the text field
                            });
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                  ),*/


                  Container
                    (
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (

                      controller: Gender,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        //label: 'Gender',
                        prefixIcon: Icon(Icons.person, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Gender",
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),


                  Container
                    (
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (
                      controller: Blood_Group,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIcon: Icon(Icons.bloodtype, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Blood Group",
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (
                      controller: Any_Disease,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        labelStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIcon: Icon(Icons.medical_information, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Disease",
                        fillColor: Colors.redAccent,
                      ),


                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (
                      controller: Describe,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        labelStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIcon: Icon(Icons.medical_information, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Describe Disease",
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),

                    width: 350,
                    height: 60,

                    child: TextFormField
                      (
                      controller: Home_Address,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.streetAddress,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      decoration: InputDecoration
                        (
                        labelStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(100),
                        ),
                        prefixIcon: Icon(Icons.home, color: Colors.white70),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
                        hintText: "Home Address",
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),


                  SizedBox(height: 10),

                  Center(
                    child: ElevatedButton
                      (
                        style: ButtonStyle
                          (
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                          minimumSize: MaterialStateProperty.all(Size(250, 50)),
                          elevation: MaterialStateProperty.all(4.0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>
                            (
                            RoundedRectangleBorder
                              (
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),

                        onPressed: () async
                        {
                          var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/addnewdonor.php");
                          var response = await http.post(url,
                              body:
                              {
                                "Name":Name.text.toString(),
                                "Number":Number.text.toString(),
                                "Email":Email.text.toString(),
                                "Gender":Gender.text.toString(),
                                "Blood_Group":Blood_Group.text.toString(),
                                "Any_Disease":Any_Disease.text.toString(),
                                "Describe":Describe.text.toString(),
                                "Home_Address":Home_Address.text.toString(),
                              }
                          );

                          if (response.statusCode == 200)
                          {
                            // Registration successful
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Registration successful"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            _dispose();
                            _cleartext();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          }
                          else
                          {
                            // Handle registration failure
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Text("Registration failed. Please try again."),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                         //_cleartext();
                         Navigator.pop(context);
                        },
                        child: Text("Add Donor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
          ),
      ),
      );
  }

  void _dispose()
  {
    Name.dispose();
    Number.dispose();
    Email.dispose();
    Gender.dispose();
    Blood_Group.dispose();
    Any_Disease.dispose();
    Describe.dispose();
    Home_Address.dispose();
    super.dispose();
  }

  void _cleartext()
  {
    Name.clear();
    Number.clear();
    Email.clear();
    Gender.clear();
    Blood_Group.clear();
    Any_Disease.clear();
    Describe.clear();
    Home_Address.clear();
  }
}
