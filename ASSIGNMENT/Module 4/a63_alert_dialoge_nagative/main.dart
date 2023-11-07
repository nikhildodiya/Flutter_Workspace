import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false
  ));
}


class MyApp extends StatelessWidget
{
  void showToast(String message) // Mehtod For Show Toast Message
  {
    Fluttertoast.showToast
      (
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.grey,
      appBar: AppBar
        (
        title: Text('Alert Dialog Example'),
      ),
      body: Center
        (
        child: ElevatedButton
          (
          onPressed: ()
          {
            showDialog
              (
              context: context,
              builder: (BuildContext context)
              {
                return AlertDialog // Show Alert Dialog Box When Elevated Button Press
                  (
                    title: Text('Choose an option'),
                    content: Text('What would you like to do?'),
                    actions: <Widget>
                  [
                    TextButton // Text Button When Alert Box Show
                      (
                      onPressed: ()
                      {
                        showToast('Positive Button Clicked');
                        Navigator.of(context).pop();
                      },
                      child: Text('Positive'),
                    ),
                    TextButton(
                      onPressed: () {
                        showToast('Negative Button Clicked');
                        Navigator.of(context).pop();
                      },
                      child: Text('Negative'),
                    ),
                    TextButton(
                      onPressed: () {
                        showToast('Neutral Button Clicked');
                        Navigator.of(context).pop();
                      },
                      child: Text('Neutral'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }
}