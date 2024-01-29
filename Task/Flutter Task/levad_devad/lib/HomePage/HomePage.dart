import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Category/AddStock.dart';
import '../Category/Bussiness.dart';
import '../Category/ClientAdd.dart';
import '../Category/Expance.dart';
import '../LoginAndSignup/LoginScreen.dart';
import 'Model.dart';

class HomePage extends StatefulWidget
{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  List<Model> Category = [];

  _HomePageState()
  {
    Category.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/client%20book.jpeg",
        "Client Book",
        "client"));
    Category.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/business.png",
        "Business Book",
        "business"));
    Category.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/stock%20book.webp",
        "Stock Book",
        "stock"));
    Category.add(Model(
        "https://nikhil2293.000webhostapp.com/Images/expence.png",
        "Expense Book",
        "expanse"
      )
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
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
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
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
              elevation: 2.0, // Add elevation for a shadow effect
              shape: RoundedRectangleBorder
                (
                borderRadius: BorderRadius.circular(8.0), // Add border radius
                ),
              child: Padding(
                padding: const EdgeInsets.all(6.0), // Add padding
                child: Column(
                  children:
                  [
                    Image.network
                    (
                      Category[i].image,
                      width: double.infinity,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      Category[i].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
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
      case "client":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ClientAdd()));
        break;

      case "business":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Business()));
        break;

      case "stock":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Stock()));
        break;

      case "expanse":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Expance()));
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
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
