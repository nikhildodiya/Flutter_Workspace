import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Tops Technologies"),),
        body: Center
          (
          child: Column(

            children:
            [

              SizedBox(width: 100,height: 100),


              SizedBox(width: 100,height: 100),

              ElevatedButton(
                child: Text("Send SMS"),
                onPressed: ()
                {
                  sendSms();
                },
              ),

              SizedBox(width: 50,height: 50),

              ElevatedButton(onPressed: (){

                callnum();

              }, child: Text("Call Us")),



            ],
          ),
        )
    );








  }
  void sendSms()
  {

    var url = Uri.parse("sms:8000599949");
    launchUrl(url);

  }


  void callnum()
  {

    var url = Uri.parse("tel:8000599949");
    launchUrl(url);
  }

}