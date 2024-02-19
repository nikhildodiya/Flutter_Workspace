import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Category/Business/AddBusiness.dart';
import '../Category/Business/ViewBusiness.dart';
import '../Category/Computer Login/ViewComputerLogin.dart';
import '../Category/CreditCard/AddCreditCard.dart';
import '../Category/CreditCard/ViewCreditCard.dart';
import '../Category/Documents/Document.dart';
import '../Category/Driving License/DrivingLicense.dart';
import '../Category/Private Photos/ViewPrivatePhotos.dart';
import '../Category/SocialMedia/AddSocialMedia.dart';
import '../Category/SocialMedia/ViewSocialMedia.dart';
import '../Category/Website Login/AddWebsitePassword.dart';
import '../Category/Website Login/ViewWebsitePassword.dart';
import '../LoginAndSignup/Login.dart';
import 'Model.dart';

class HomePage extends StatefulWidget
{
  late String? phoneNumber;

  HomePage([String? phoneNumber]) : this.phoneNumber = phoneNumber;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>
{
  late String phonenumber;
  List<Model> Category = [];

  _HomePageState()
  {
    Category.add(Model(
        "assets/Business.jpg",
        "Business",
        "Busi"));

    Category.add(Model(
        "assets/Computer login.jpg",
        "Computer Login",
        "Computer"));

    Category.add(Model(
        "assets/Credit Card.jpg",
        "Credit Card",
        "Credit"));

    Category.add(Model(
        "assets/Documents.jpg",
        "Important Documents",
        "Docs"
    ));

        Category.add(Model(
        "assets/private photos.jpg",
        "Private Photos",
        "Photos"
    ));

    Category.add(Model(
        "assets/Social media.jpg",
        "Social Media",
        "Social"
    ));

        Category.add(Model(
        "assets/Website.jpg",
        "Website Password",
        "Web"
    ));
    Category.add(Model(
        "assets/Driver.jpeg",
        "Drivers License",
        "License"
    ));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Account Information Handler", style: GoogleFonts.aleo
          (
            fontSize: 16,
          )),
        backgroundColor: Colors.black,
        actions: <Widget>
        [

          PopupMenuButton<String>
            (
            onSelected: (value)
            {
              if (value == 'logout')
              {
                _logout();
              }
            },
            itemBuilder: (BuildContext context)
            {
              return ['logout'].map((String choice)
              {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: Category == null ? 0 : Category.length,
        itemBuilder: (ctx, i)
        {
          return GestureDetector
            (
            onTap: ()
            {
                  _performCustomActivity(Category[i]);
            },
            child: Card(
              elevation: 5.0, // Add elevation for a shadow effect
              shape: RoundedRectangleBorder
                (
                borderRadius: BorderRadius.circular(8.0), // Add border radius
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0), // Add padding
                child: Column(
                  children:
                  [
                    Image.asset
                    (
                      Category[i].image,
                      width: double.infinity,
                      height: 125.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      Category[i].name,
                      style: GoogleFonts.allerta
                        (
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _performCustomActivity(Model selectedModel)
  {
    var type = selectedModel.type;
    switch (type)
    {
      case "Busi":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BusinessView()));
        break;

      case "Computer":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ComputerLoginView()));
        break;

      case "Credit":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreditCard()));
        break;

      case "Docs":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DocumentUploadScreen()));
        break;

      case "Photos":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => view()));
        break;

      case "Social":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SocialMedia()));
        break;

      case "Web":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebsitePasswordView()));
        break;

      case "License":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DrivingLicense()));
        break;

      default:
        break;
    }
  }

  void _logout() async
  {
    SharedPreferences logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', true);
    logindata.remove('Number');

    // Navigate to the login screen
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }
}