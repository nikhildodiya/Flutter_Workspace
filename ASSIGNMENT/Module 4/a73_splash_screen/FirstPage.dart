import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
          appBar: AppBar(title: Text("WelCome Page"),),

        body: Center
          (
            child: Column
              (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text("WelCome To My Application", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),)
                  ],
              ),
          ),

    );
  }
}
