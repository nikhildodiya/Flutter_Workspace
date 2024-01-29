import 'package:flutter/material.dart';

class Expance extends StatefulWidget
{
  const Expance({Key? key}) : super(key: key);

  @override
  State<Expance> createState() => _ExpanceState();
}

class _ExpanceState extends State<Expance>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Add Expance"),
        backgroundColor: Colors.green,
        ),
      );
  }
}
