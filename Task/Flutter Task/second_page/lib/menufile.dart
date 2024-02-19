import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Menu extends StatefulWidget
{
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu>
{
  bool one = false;
  bool two = false;
  bool three = false;
  var total = 0;
  var amount = 0;
  var data = "";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Menu"),),

      body: Center(

        child: Column(

          children: [

            SizedBox(width: 50, height: 50),

            Text('Menu', style: TextStyle(fontSize: 20.0),),

            CheckboxListTile
              (
              title: Text("Pizza"),
              subtitle: Text("Rs. 199"),
              value: one,
              onChanged: (bool? value)
              {
                setState(()

                {
                  this.one = value!;
                  amount+=100;
                  data+="\n pizza @ Rs.100";
                });
              },
            ),

            CheckboxListTile
              (
              title: Text("dosa"),
              subtitle: Text("Rs. 89"),
              value: two,
              onChanged: (bool? value)
              {
                setState(()
                {
                  this.two = value!;
                  amount+=89;
                  data+="\n Dosa @ Rs.89";
                });
              },
            ),

            CheckboxListTile
              (
              title: Text("Maggie"),
              subtitle: Text("Rs. 119"),
              value: three,
              onChanged: (bool? value)
              {
                setState(()
                {
                  this.three = value!;
                  amount+=119;
                  data+="\n Maggie @ Rs.119";
                });
              },
            ),


            ElevatedButton(onPressed: ()
            {
              toastMsg();
            }, child: Text("Order")),

          ],
        ),
      ),
    );
  }

  void toastMsg()
  {
    Fluttertoast.showToast
      (
        msg: "Welcome Our FastFood",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0
    );
  }
}

