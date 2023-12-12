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
  TextEditingController Gender = TextEditingController();
  TextEditingController Hobbies = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  bool _passwordVisible = false;
  bool _ConpasswordVisible = false;



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
                                if (value == null || value.isEmpty)
                                {
                                  return 'Please enter Mobile number';
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


                            TextFormField
                              (
                              controller: Gender,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration
                                (
                                prefixIcon: Icon(Icons.person),
                                labelText: "Gender",
                                hintText: "Enter Your Gender",
                              ),
                              validator: (value)
                              {
                                if (value == null || value.isEmpty)
                                {
                                  return 'Please enter Gender';
                                }
                                return null;
                              },
                            ),

                            TextFormField
                              (
                              controller: Hobbies,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration
                                (
                                prefixIcon: Icon(Icons.sports_cricket),
                                labelText: "Hobbies",
                                hintText: "Enter Your Hobbies",
                              ),
                              validator: (value)
                              {
                                if (value == null || value.isEmpty)
                                {
                                  return 'Please enter Hobbies';
                                }
                                return null;
                              },
                            ),

                            TextFormField
                              (
                              controller: City,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration
                                (
                                prefixIcon: Icon(Icons.location_city),
                                labelText: "City",
                                hintText: "Enter Your City",
                              ),
                              validator: (value)
                              {
                                if (value == null || value.isEmpty)
                                {
                                  return 'Please enter your City';
                                }
                                return null;
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
                              validator: (value)
                              {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Password';
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
                                      builder: (context) => NextScreen(
                                        name: FirstName.text,
                                        lastname: LastName.text,
                                        mobile: Mobile.text,
                                        email: Email.text,
                                        hobbies: Hobbies.text,
                                        gender: Gender.text,
                                        city: City.text,
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
