import 'package:flutter/material.dart';

import 'NextScreen.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget
{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Hobbies = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  bool _passwordVisible = false;
  bool _ConpasswordVisible = false;

  String selectedGender = '';

  List<String> selectedHobbies = [];


  String selectedScroll = 'Rajkot';
  // List<String> cityoptions = ['Rajkot', 'Ahmedabad', 'Jamnagar', 'Junagadh'];


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Registration Form"),backgroundColor: Colors.deepPurple,),
      body: SingleChildScrollView(
        child: Form
          (
          key: _formKey,
          child: Column
            (
            children:
            [
              TextFormField
                (
                controller: FirstName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration
                  (
                  prefixIcon: Icon(Icons.person),
                  labelText: "First Name",
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


              TextFormField
                (
                controller: LastName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration
                  (
                  prefixIcon: Icon(Icons.person),
                  labelText: "Last Name",
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


              TextFormField
                (
                controller: Mobile,
                keyboardType: TextInputType.text,
                decoration: InputDecoration
                  (
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  labelText: "Mobile Number",
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

              TextFormField
                (
                controller: Email,
                keyboardType: TextInputType.text,
                decoration: InputDecoration
                  (
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
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


              Container
                  (
                child: Center(
                  child: Row
                      (
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        [
                          SizedBox(width: 20),
                          Text(
                              "City"
                          ),
                          SizedBox(width: 20),
                          DropdownButton<String>
                            (
                            value: selectedScroll,
                            onChanged: (String? newValue)
                            {
                              setState(()
                              {
                                selectedScroll = newValue!;
                              });
                            },
                            items: <String>['Rajkot', 'Jamnagar', 'Morbi', 'Junagadh']
                                .map((String value)
                            {
                              return DropdownMenuItem<String>
                                (
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                ),
              ),

                Row(
                  children: [
                    Container(
                      child: Text(
                        'Hobbies:',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                CheckboxListTile(
                  title: Text('Reading'),
                  value: selectedHobbies.contains('Reading'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value)
                      {
                        selectedHobbies.add('Reading');
                      } else {
                        selectedHobbies.remove('Reading');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Gaming'),
                  value: selectedHobbies.contains('Gaming'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value)
                      {
                        selectedHobbies.add('Gaming');
                      } else {
                        selectedHobbies.remove('Gaming');
                      }
                    });
                  },
                ),

                CheckboxListTile(
                  title: Text('Sports'),
                  value: selectedHobbies.contains('Sports'),
                  onChanged: (bool? value) {
                    setState(()
                    {
                      if (value != null && value) {
                        selectedHobbies.add('Sports');
                      } else {
                        selectedHobbies.remove('Sports');
                      }
                    });
                  },
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
                  labelText: "Password",
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


              TextFormField(
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
                  labelText: "Confirm Password",
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


              SizedBox(height: 11,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed with submission
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextScreen
                          (
                          name: FirstName.text,
                          lastname: LastName.text,
                          mobile: Mobile.text,
                          email: Email.text,
                          hobbies: selectedHobbies.toString(),
                          gendervalue: selectedGender,
                          city: selectedScroll,
                          password: Password.text,
                          confirmpaswword: ConfirmPassword.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
