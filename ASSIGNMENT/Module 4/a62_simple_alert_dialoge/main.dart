import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
));


class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (
            title: Text('Alert Dialog'),
          ),
      body: Center(
        child: ElevatedButton
          (
          onPressed: ()
          {
            _showAlertDialog(context);
          },
          child: Text('Show Alert'),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) // Method Call When Elevated Button Pressed
  {
    showDialog
      (
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog // Alert Dialoge Box When 'Show Alert' Button Pressed
          (
          title: Text('Alert Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>
            [
              Icon // Show Icon In Alert Box
                (
                Icons.warning,
                size: 50,
                color: Colors.orange,
              ),
              SizedBox(height: 10),
              Text('hello My Self Nikhil Dodiya,'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
