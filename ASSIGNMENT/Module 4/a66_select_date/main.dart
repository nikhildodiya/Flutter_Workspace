import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget
{
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<MyApp>
{
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async
  {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child)
      {
        return Theme
          (
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Change the primary color
            hintColor: Colors.blue, // Change the accent color
            colorScheme: ColorScheme.light(primary: Colors.blue), // Change the color scheme
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Button text color
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
               child: Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon( // Added an icon to the button
              onPressed: () => _selectDate(context),
              icon: Icon(Icons.date_range),
              label: Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}