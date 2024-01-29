import 'package:flutter/material.dart';

class ViewDonor extends StatefulWidget
{
  @override
  State<ViewDonor> createState() => _ViewDonorState();
}

class _ViewDonorState extends State<ViewDonor>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Donor Details"),
        backgroundColor: Colors.redAccent,
        ),
      );
  }
}
