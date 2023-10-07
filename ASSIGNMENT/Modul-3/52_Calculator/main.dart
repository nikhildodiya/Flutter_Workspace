import 'package:flutter/material.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget
{
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp>
{
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  String _result = '';
  String _operation = 'Add';

  void _calculateResult()
  {
    double number1 = double.tryParse(_number1Controller.text) ?? 0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0;
    double result = 0;

    switch (_operation) {
      case 'Add':
        result = number1 + number2;
        break;
      case 'Subtraction':
        result = number1 - number2;
        break;
      case 'Multiply':
        result = number1 * number2;
        break;
      case 'Division':
        if (number2 != 0) {
          result = number1 / number2;
        } else {
          _result = 'Cannot divide by zero';
          return;
        }
        break;
    }

    setState(()
    {
      _result = 'Result: $result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              title: Text('Add'),
              value: 'Add',
              groupValue: _operation,
              onChanged: (value) {
                setState(() {
                  _operation = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Subtraction'),
              value: 'Subtraction',
              groupValue: _operation,
              onChanged: (value)
              {
                setState(()
                {
                  _operation = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Multiply'),
              value: 'Multiply',
              groupValue: _operation,
              onChanged: (value) {
                setState(() {
                  _operation = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Division'),
              value: 'Division',
              groupValue: _operation,
              onChanged: (value) {
                setState(() {
                  _operation = value.toString();
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter number 1'),
            ),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter number 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateResult,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }
}