import 'package:flutter/material.dart';
import 'package:handler/HomePage/HomePage.dart';
import 'package:http/http.dart' as http;
import 'ViewSocialMedia.dart';

class AddSocialMedia extends StatefulWidget
{
  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<AddSocialMedia>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Name = TextEditingController();
  TextEditingController UserName = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Mobile = TextEditingController();

  /*void _cleartext()
  {
    Name.clear();
    UserName.clear();
    Password.clear();
    Email.clear();
    Mobile.clear();
  }*/

  String selectedSocialMedia = 'Selected Social Media';
  List<String> socialMediaList =
  [
    'Selected Social Media', 'Facebook', 'Twitter', 'Instagram', 'LinkedIn', 'SnapChat', 'Telegram', 'WhatsApp', 'Pinterest'
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Social Media"),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Social Media:", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),

                      //width: 100,
                      height: 60,

                      child: DropdownButton<String>(
                        value: selectedSocialMedia,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue)
                        {
                          setState(()
                          {
                            selectedSocialMedia = newValue!;
                          });
                        },
                        items: socialMediaList.map<DropdownMenuItem<String>>((String value)
                        {
                          return DropdownMenuItem<String>
                          (
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                Text("-----------------------------------"),

                Container(

                  padding: EdgeInsets.all(8.0),
                  child: TextFormField
                    (
                    controller: Name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration
                      (
                      prefixIcon: Icon(Icons.person),
                      //  labelText: "First Name",
                      hintText: "Enter Your social Media Name",
                    ),
                    validator: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please Enter Your Social Media Name';
                      }
                      return null;
                    },
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField
                    (
                    controller: UserName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration
                      (
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Userame/Handle",
                    ),
                    validator: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please Enter Your Social Media User Name Or Handle';
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField
                    (
                    controller: Password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration
                    (
                      prefixIcon: Icon(Icons.drag_handle_rounded),
                      hintText: "Enter Password",
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField
                    (
                    controller: Email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration
                      (
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter Email Address",
                    ),
                    validator: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please Enter Your Email';
                      }
                      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value))
                      {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField
                    (
                    controller: Mobile,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration
                      (
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      hintText: "Enter Phone Number",
                    ),
                    validator: (value)
                    {
                      if (value?.length != 10)
                      {
                        return 'Please enter Valid Phone number';
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
                      var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlersocialmedia.php");
                      var response = await http.post(url,
                          body:
                          {
                            "selectedSocialMedia":selectedSocialMedia.toString(),
                            "Name":Name.text,
                            "UserName":UserName.text,
                            "Password":Password.text,
                            "Email":Email.text,
                            "Mobile":Mobile.text,
                          });

                      if (response.statusCode == 200)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Details Added successful", style: TextStyle(color: Colors.white),),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.black,
                          ),
                        );
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SocialMedia()));
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
      ),
    );
  }
}