import 'package:box_decoration/secondPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget
{
  @override
  pageState createState() => pageState();
}
class pageState extends State<page1>
{
  @override
  Widget build(BuildContext context)
{

    return Scaffold(

        body: Column(

          children: [
            Row(
                children:[

                  SizedBox(height: 30),
                  Container(

                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.red),
                      margin: EdgeInsets.only(top: 5)
                  ),
                ]
            ),
            Row(
                children:[
                  Container(

                      height: 150,
                      width: 176,
                      decoration: BoxDecoration(color: Colors.lightBlue),
                      margin: EdgeInsets.only(top: 5)
                  ),
                  Container(

                      height: 150,
                      width: 176,
                      decoration: BoxDecoration(color: Colors.lightBlue),
                      margin: EdgeInsets.only(top: 5,left: 5)
                  ),
                ]
            ),
            Row(
                children:[
                  Container(

                      height: 150,
                      width: 176,
                      decoration: BoxDecoration(color: Colors.lightBlue),
                      margin: EdgeInsets.only(top: 5)
                  ),
                  Container(

                      height: 150,
                      width: 176,
                      decoration: BoxDecoration(color: Colors.lightBlue),
                      margin: EdgeInsets.only(top: 5,left: 5)
                  ),
                ]
            ),
            Row(
              children: [

                Container
                  (
                  height: 130,
                  width: 115,
                  decoration: BoxDecoration(color: Colors.yellow),
                  margin: EdgeInsets.only(top: 5),
                ),
                Container(
                  height: 130,
                  width: 115,
                  decoration: BoxDecoration(color: Colors.yellow),
                  margin: EdgeInsets.only(top: 5,left: 5),
                ),
                Container(
                  height: 130,
                  width: 115,
                  decoration: BoxDecoration(color: Colors.yellow),
                  margin: EdgeInsets.only(top: 5,left: 5),
                ),
              ],
            ),
            Row(
              children: [

                Container(
                  height: 130,
                  width: 115,
                  decoration: BoxDecoration(color: Colors.yellow),
                  margin: EdgeInsets.only(top: 5),
                ),
                Container(
                  height: 130,
                  width: 115,
                  decoration: BoxDecoration(color: Colors.yellow),
                  margin: EdgeInsets.only(top: 5,left: 5),
                ),
                Container(
                  height: 130,
                  width: 115,
                  decoration: BoxDecoration(color: Colors.yellow),
                  margin: EdgeInsets.only(top: 5,left: 5),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton
          (
          child: Icon(Icons.navigate_next_rounded),
          onPressed: ()
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page2()));
          },
        )
    );
  }
}