import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget
{
  @override
  _CitySelectionExampleState createState() => _CitySelectionExampleState();
}

class _CitySelectionExampleState extends State<MyApp>
{
  String selectedCity = ""; // Variable To store Value

  final List<String> cities = ['Rajkot', 'Ahmedabad', 'Jamnagar', 'Vadodara', 'Surat'];

  void _showCitySelectionDialog()
  {
    showDialog
      (
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title: Text('Select a City'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: cities.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index)
              {
                return RadioListTile<String>(
                  title: Text(cities[index]),
                  value: cities[index],
                  groupValue: selectedCity,
                  onChanged: (String? value) {
                    setState(()
                    {
                      selectedCity = value!;
                    });
                    Navigator.of(context).pop();
                    _showCitySelectedSnackbar(value!); // Provide feedback
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showCitySelectedSnackbar(String city)
  {
    ScaffoldMessenger.of(context).showSnackBar
      (
      SnackBar
        (
        content: Text('Selected city: $city'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selection'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Center(
                child: Text(
                  selectedCity,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0, // Adjusted font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(// Added an icon to the button
              onPressed: _showCitySelectionDialog,
              icon: Icon(Icons.location_city),
              label: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }
}