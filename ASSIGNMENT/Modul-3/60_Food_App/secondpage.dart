import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class dish extends StatefulWidget
{
  @override
  dishState createState() => dishState();

}

class dishState  extends State<dish> {
  double _prize = 12;
  double _product = 1;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(height: 50,),
                IconButton(
                    highlightColor: CupertinoColors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Spacer(),
                IconButton(
                    color: Colors.white70,
                    padding: EdgeInsets.only(left: 100),
                    iconSize: 30,
                    onPressed: () {
                      toggleLike();
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.black,))
              ],
            ),

            Container(
              height: 730,
              width: double.infinity,
              margin: EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                  )
              ),
            ),
            Positioned(
                top: 80,
                left: 120,
                child: ClipOval(
                  child: Image.network(
                    "https://paternalistic-hiera.000webhostapp.com/Images/OIP.jpeg",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,),
                )
            ),

            Positioned(
              top: 240,
              left: 100,

              child: Text("Sei Ua Samun phrai",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Positioned(
                top: 290,
                left: 70,
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.blue,),
                    Text("50 min"),
                    SizedBox(width: 30,),
                    Icon(Icons.star, color: Colors.orange,),
                    Text("4.8"),
                    SizedBox(width: 30,),
                    Icon(Icons.local_fire_department, color: Colors.orange,),
                    Text("325 Kcal"),
                  ],
                )
            ),
            Positioned(
                top: 320,
                left: 70,
                child: Center(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          //padding: EdgeInsets.all(10),
                          width: 230,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(" $_prize Rs", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                ),
                                Container(
                                  //margin: EdgeInsets.only(left: 20),
                                  width: 150,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [

                                      IconButton
                                        (
                                        icon: Icon(Icons.remove),
                                        iconSize: 20,
                                        color: Colors.black,

                                        onPressed: () {
                                          _removeproduct();
                                        },
                                      ),


                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              50),
                                        ),
                                        child: Center(
                                          child: Text("$_product"),),
                                      ),


                                      IconButton
                                        (
                                        icon: Icon(Icons.add),
                                        iconSize: 20,
                                        //padding: EdgeInsets.all(50),
                                        color: Colors.black,
                                        onPressed: () {
                                          _addproduct();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                )
            ),

            Positioned(
              child: Text("Ingredirnta",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
              top: 420,
              left: 25,
            ),

            Positioned(
                top: 480,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            // Border radius for the container
                            child: Image.network(
                              "https://paternalistic-hiera.000webhostapp.com/Images/noodles.jpg",
                              // Replace with your image file path
                              // width: 40.0,
                              // height: 40.0,
                              fit: BoxFit
                                  .cover, // BoxFit to cover the container
                            )
                        ),
                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            // Border radius for the container
                            child: Image.network(
                              "https://paternalistic-hiera.000webhostapp.com/Images/shrimp.jpeg",
                              // Replace with your image file path
                              // width: 40.0,
                              // height: 40.0,
                              fit: BoxFit
                                  .cover, // BoxFit to cover the container
                            )
                        ),
                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            // Border radius for the container
                            child: Image.network(
                              "https://paternalistic-hiera.000webhostapp.com/Images/egg.jpeg",
                              // Replace with your image file path
                              // width: 40.0,
                              // height: 40.0,
                              fit: BoxFit
                                  .cover, // BoxFit to cover the container
                            )
                        ),
                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            // Border radius for the container
                            child: Image.network(
                              "https://paternalistic-hiera.000webhostapp.com/Images/scallion.jpeg",
                              // Replace with your image file path
                              // width: 40.0,
                              // height: 40.0,
                              fit: BoxFit
                                  .cover, // BoxFit to cover the container
                            )
                        ),
                      )
                    ],
                  ),
                )
            ),

            Positioned(

              top: 630,
              left: 30,
              child: Row(

                children: [

                  Text("Noodles"),

                  SizedBox(width: 45,),

                  Text("Shrimp"),

                  SizedBox(width: 45,),

                  Text("Egg"),

                  SizedBox(width: 45,),

                  Text("Scallion"),

                  SizedBox(width: 45,),
                ],
              ),
            ),

            Positioned(

              top: 710,
              left: 20,
              child: Text("about",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Positioned(
                top: 750,
                left: 15,
                child: Text(
                    "A vibreant Thai sausage made qith ground chicken, plus its \n spicy  chile dip,from chef parmass sayang of Atlanta's \n talat market.")
            )

          ],
        ),
      ),
    );
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _addproduct() {
    setState(() {
      if (_product <= 5) {
        _product += 1; // Increase 1 unit in product count
        _prize *= _product;
      }
    });
  }

  void _removeproduct() {
    setState(() {
      if (_product > 1) {
        _product -= 1; // Decrease 1 unit in product count
        _prize /= (_product +
            1); // Update the prize by dividing it by the previous product count + 1
      }
    });
  }
}