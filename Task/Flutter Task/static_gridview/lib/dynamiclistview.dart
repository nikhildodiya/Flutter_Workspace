import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DynamicListView extends StatefulWidget
{
  List<Model>mobilelist;
  DynamicListView({required this.mobilelist});

  @override
  DynamicState createState() => DynamicState(mobilelist: mobilelist);


}

class DynamicState extends State<DynamicListView>
{

  List<Model>mobilelist ;
  DynamicState({required this.mobilelist});

  @override
  Widget build(BuildContext context)
  {

   // mobilelist =List<Model>();
    mobilelist.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/python.png", "Python"));
    mobilelist.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/my.png", "MySql"));
    mobilelist.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/java.png", "Java"));
    mobilelist.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/php.png", "PHP"));
    mobilelist.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/android.jpg", "Andorid"));

    return Scaffold(

        appBar: AppBar(title: Text("Custom List"),),
        body: Container
          (
            child: ListView.builder
              (

                itemCount: mobilelist == null ? 0 : mobilelist.length,
                itemBuilder: (ctx, i) {
                  return ListTile
                    (
                    leading: Image.network(mobilelist[i].image,width: 100,height: 250),
                    title: Text(mobilelist[i].name),
                  );
                }
            )
          )
    );
  }
}