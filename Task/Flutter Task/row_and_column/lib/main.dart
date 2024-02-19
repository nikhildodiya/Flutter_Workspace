import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: FirstPage(),
    debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
        return Scaffold(appBar: AppBar(title: Text("Row And Column Example"),),

          body: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(

                decoration: BoxDecoration
                  (
                      borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: Padding
                  (
                      padding: EdgeInsets.all(10.0),
                  child: Text("Welcome", style: TextStyle(color: Colors.brown, fontSize: 15),),
                  ),
              ),


              Container(

                decoration: BoxDecoration
                  (
                    borderRadius: BorderRadius.circular(10), color: Colors.yellow),
                child: Padding
                  (
                  padding: EdgeInsets.all(10.0),
                  child: Text("Welcome", style: TextStyle(color: Colors.black, fontSize: 15),),
                ),
              ),

              Container(

                decoration: BoxDecoration
                  (
                    borderRadius: BorderRadius.circular(10), color: Colors.blue),
                child: Padding
                  (
                  padding: EdgeInsets.all(10.0),
                  child: Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 15),),
                  ),
              ),
            ],
          ),
        );
  }
}
