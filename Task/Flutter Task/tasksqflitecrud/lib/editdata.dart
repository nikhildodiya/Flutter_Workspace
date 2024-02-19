import 'package:flutter/material.dart';
import 'package:tasksqflitecrud/viewdata.dart';

import 'db.dart';
import 'main.dart';

class EditStudent extends StatefulWidget
{

  String email;
  EditStudent({super.key, required this.email});

  @override
  State<EditStudent> createState() => _State();
}

class _State extends State<EditStudent>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  late Mydb mydb = Mydb();

  bool _passwordVisible = false;
  bool _ConpasswordVisible = false;

  String selectedGender = '';

  List<String> selectedHobbies = [];

  bool isCitySelected()
  {
    return SelectedCity != 'Select City';
  }

  bool isGenderSelected()
  {
    return selectedGender.isNotEmpty;
  }

  bool isHobbySelected()
  {
    return selectedHobbies.isNotEmpty;
  }

  String SelectedCity = "Select City";
  List<String> cityoptions = ['Select City', 'Rajkot', 'Ahmedabad', 'Jamnagar', 'Junagadh'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mydb.open();

    Future.delayed(Duration(microseconds: 500),()async
    {
      var data = await mydb.getsinglerecord(widget.email);

      if(data != null)
      {
        FirstName.text = data["first_name"];
        LastName.text = data["last_name"];
        Mobile.text = data["mobile"];
        Email.text = data["email"];
        selectedGender = data["gender"].toString();
        selectedHobbies = List<String>.from(data["hobbies"]?.toString()?.split(', ') ?? []);
        SelectedCity = data["city"].toString();
        Password.text = data["password"];
        ConfirmPassword.text = data["confirm_password"];
        setState(() {
        });
      }
      else
      {
        print("No any data with Email " + widget.email.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Edit Page"),),
      body:
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container
              (
              child: Column(

                children: [

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(6.0),

                    width: 370,
                    height: 60,
                    child: TextFormField
                      (
                      controller: FirstName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter Your First Name",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter First name';
                        }
                        return null;
                      },
                    ),
                  ),


                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(6.0),

                    width: 370,
                    height: 60,
                    child: TextFormField
                      (
                      controller: LastName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter Your Last Name",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter Last name';
                        }
                        return null;
                      },
                    ),
                  ),


                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(6.0),

                    width: 370,
                    height: 60,
                    child: TextFormField
                      (
                      controller: Mobile,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        hintText: "Enter Your Mobile Number",
                      ),
                      validator: (value)
                      {
                        if (value == null || value.isEmpty || value.length != 10)
                        {
                          return 'Please enter Valid Mobile number';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(6.0),

                    width: 370,
                    height: 60,
                    child: TextFormField
                      (
                      controller: Email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration
                        (
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter Your Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter Email';
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
                    height: 70,
                    decoration: BoxDecoration
                      (
                        shape: BoxShape.circle
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        Text("Gender"),

                        Radio(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        Text("Male"),
                        Radio(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (String? value)
                          {
                            setState(()
                            {
                              selectedGender = value!;
                            });
                          },
                        ),
                        Text("Female")
                      ],
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                    [
                      Text(
                        'City:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),
                        height: 60,
                        child: DropdownButton<String>(
                          value: SelectedCity,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              SelectedCity = newValue!;
                            });
                          },
                          items: cityoptions.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),


                  Row(
                    children: [
                      Container(
                        child: Text(
                          'Hobbies:',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Checkbox(
                        value: selectedHobbies.contains('Reading'),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null && value)
                            {
                              selectedHobbies.add('Reading');
                            }
                            else
                            {
                              selectedHobbies.remove('Reading');
                            }
                          });
                        },
                      ),
                      Text('Reading'),
                      Checkbox(
                        value: selectedHobbies.contains('Gaming'),
                        onChanged: (bool? value) {
                          setState(()
                          {
                            if (value != null && value)
                            {
                              selectedHobbies.add('Gaming');
                            } else
                            {
                              selectedHobbies.remove('Gaming');
                            }
                          });
                        },
                      ),
                      Text('Gaming'),
                      Checkbox(
                        value: selectedHobbies.contains('Cricket'),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null && value) {
                              selectedHobbies.add('Cricket');
                            } else {
                              selectedHobbies.remove('Cricket');
                            }
                          });
                        },
                      ),
                      Text('Cricket'),
                    ],
                  ),



                  TextFormField(
                    controller: Password,
                    keyboardType: TextInputType.text,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon
                          (_passwordVisible ? Icons.visibility
                            : Icons.visibility_off,
                        ),
                        onPressed: ()
                        {
                          setState(()
                          {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      hintText: "Enter Your Password",
                    ),
                    validator: (passcurrentvalue)
                    {
                      RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      var passnonnullvalue = passcurrentvalue??"";
                      if(passnonnullvalue.isEmpty)
                      {
                        return ("password is required");
                      }
                      else if(passnonnullvalue.length<6)
                      {
                        return ("password must be more than 5 characters");
                      }
                      else if(!regex.hasMatch(passnonnullvalue))
                      {
                        return ("password should contain upper,lower,digit and special character ");
                      }
                      return null;
                    },
                  ),


                  TextFormField
                    (
                    controller: ConfirmPassword,
                    keyboardType: TextInputType.text,
                    obscureText: !_ConpasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon
                          (_ConpasswordVisible ? Icons.visibility
                            : Icons.visibility_off,
                        ),
                        onPressed: ()
                        {
                          setState(()
                          {
                            _ConpasswordVisible = !_ConpasswordVisible;
                          });
                        },
                      ),
                      hintText: "Enter Your Confirm Password",
                    ),
                    validator: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter your Confirm Password';
                      }
                      else if (value != Password.text)
                      {
                        return 'Password Dont Match';
                      }
                      return null;
                    },
                  ),

                  ElevatedButton(onPressed: () async
                  {
                    if (_formKey.currentState!.validate() &&
                        isCitySelected() &&
                        isHobbySelected() &&
                        isGenderSelected())
                    {
                    await  mydb.db.rawUpdate("update students set first_name=?,last_name=?,mobile=?,email=?,hobbies=?,gender=?,city=?,password=?,confirm_password=? where email=?",
                          [FirstName.text.toString(),LastName.text.toString(),Mobile.text.toString(),
                            Email.text.toString(),selectedHobbies.join(', '),selectedGender.toString(),
                            SelectedCity.toString(),Password.text.toString(),ConfirmPassword.text.toString(),
                            widget.email,
                          ]);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ViewData(),),);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You are successfully Submitted!'),
                        ),
                      );
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar
                          (
                          content: Text('Please Fillout Valid Details'),
                        ),
                      );
                    }
                  }, child: Text("Update"))
                ],


              ),



            ),
          ),
        ),
      ),

    );
  }
}