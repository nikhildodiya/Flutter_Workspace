import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizedPageView extends StatefulWidget
{
  @override
  CustomizedState createState() => CustomizedState();


}

class CustomizedState extends State<CustomizedPageView>
{

  int currentPage = 0;
  @override
  Widget build(BuildContext context)
  {
    final panels = PageView(
      onPageChanged: (int page) {
        setState(() {
          currentPage = page;
        });
      },
      controller: PageController(initialPage: 0),
      children: <Widget>[Panel1(),  Panel2(),],
    );



    return Scaffold(

      appBar: AppBar(title: Text("Customized"),),
      body: Container(
        child: Stack(children: <Widget>[


          panels,

          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>
                    [
                      for (int i = 0; i < 2; i++)
                        (i == currentPage ? circleBar(true) : circleBar(false))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.blue[700] : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Panel1 extends StatefulWidget
{
  @override
  Panel1State createState() => Panel1State();


}

class Panel1State extends State<Panel1>
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          //border: Border.all(color: Colors.grey[200]),
          boxShadow: <BoxShadow>[
            BoxShadow(
              // color: Colors.grey[500].withOpacity(1.0),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('PageView 1',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }

}

class Panel2 extends StatefulWidget
{
  @override
  Panel2State createState() => Panel2State();
}

class Panel2State extends State<Panel2>
{
  @override
  Widget build(BuildContext context) {


    return Center(
      child: Container(
        width: 400,
        height: 400,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.grey[200]),
          boxShadow: <BoxShadow>
          [
            BoxShadow
              (
              // color: Colors.grey[500].withOpacity(1.0),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('PageView 2',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}