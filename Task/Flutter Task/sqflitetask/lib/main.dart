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

  MyDb mydb = new MyDb();


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
  }

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
                  keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.text,
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


              SizedBox(height: 11,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  minimumSize: MaterialStateProperty.all(Size(250, 50)),
                  elevation: MaterialStateProperty.all(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      isCitySelected() &&
                      isHobbySelected() &&
                      isGenderSelected())
                  {
                    _insertData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Viewdata(),),);
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please Fillout Valid Details'),
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

  void _insertData()
  {
    String firstName = FirstName.text;
    String lastName = LastName.text;
    String mobile = Mobile.text;
    String email = Email.text;
    String hobbies = selectedHobbies.join(', ');
    String gender = selectedGender;
    String city = SelectedCity;
    String password = Password.text;
    String confirmPassword = ConfirmPassword.text;

    mydb.db.rawInsert(
      "INSERT INTO registration (first_name, last_name, mobile, email, hobbies, gender, city, password, confirm_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
      [firstName, lastName, mobile, email, hobbies, gender, city, password, confirmPassword],
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("User data saved successfully"),
      ),
    );

  }
}
