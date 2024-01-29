import 'package:flutter/material.dart';
import 'model.dart';

class customelistview extends StatefulWidget
{
  @override
  _customelistview  createState() => _customelistview();
}

class _customelistview extends State<customelistview >
{
  @override
  Widget build(BuildContext context)
  {
    {
      List<Model>SocialMedia = [];

      SocialMedia.add(Model(
          "https://nikhil2293.000webhostapp.com/Images/whatsapp.webp", "Facebook",
          "Whatsapp Description"));
      SocialMedia.add(Model(
          "https://nikhil2293.000webhostapp.com/Images/facebook.png", "Facebook",
          "Facebbok Description"));
      SocialMedia.add(Model(
          "https://nikhil2293.000webhostapp.com/Images/twitter.jpg", "Twitter",
          "Twitter Description"));

      SocialMedia.add(Model(
          "https://nikhil2293.000webhostapp.com/Images/insta.avif", "Instagram",
          "Instgram Description"));



      return Scaffold(
          body: ListView.builder(

              itemCount: SocialMedia == null ? 0 : SocialMedia.length,
              itemBuilder: (ctx, i)
              {
                return ListTile
                  (

                    leading: Image.network(SocialMedia[i].image,width: 100,height: 250),
                    title: Text(SocialMedia[i].name),
                    subtitle: Text(SocialMedia[i].des));
              }
          )
      );
   }
  }
}
