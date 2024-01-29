import 'package:flutter/material.dart';

class Search extends StatefulWidget
{
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar:  AppBar(title: Text("Search Donor"),backgroundColor: Colors.redAccent,),

      body: Center
        (
          child: Column
            (
              children:
              [
                Container
                  (
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(5.0),

                  width: 350,
                  height: 60,

                  child: TextField
                    (

                    // controller: search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder
                        (
                        borderRadius: BorderRadius.circular(100),
                      ),
                      //label: 'Gender',
                      suffix: Icon(Icons.search),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      hintText: "Donor Search Here",
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                ElevatedButton
                  (
                    style: ButtonStyle
                      (
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      minimumSize: MaterialStateProperty.all(Size(250, 50)),
                      elevation: MaterialStateProperty.all(4.0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>
                        (
                        RoundedRectangleBorder
                          (
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: ()
                    {

                    },
                    child: Text("Search", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ],
            ),
        ),
      );
  }
}
