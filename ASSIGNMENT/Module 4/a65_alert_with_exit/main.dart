import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),
debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget
{
  @override
  _ExitState createState() => _ExitState();
}

class _ExitState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return WillPopScope
      (
      onWillPop: () async
      {
        bool shouldExit = await showExitAlertDialog(context);
        return shouldExit;
      },
      child: Scaffold
        (
        appBar: AppBar
          (
          title: Text('Exit Confirmation Example'),
        ),
        body: Center(
          child: Text('Press the back button to exit the app.'),
        ),
      ),
    );
  }

  showExitAlertDialog(BuildContext context)
  {
    return showDialog(
      context: context,
      builder: (context)
      {
        return AlertDialog(
          title: Text('Confirm Exit'),
          content: Text('Are You Sure..? You Want To Exit'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false); // Continue with app
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true); // Exit the app
              },
            ),
          ],
        );
      },
    );
  }
}
