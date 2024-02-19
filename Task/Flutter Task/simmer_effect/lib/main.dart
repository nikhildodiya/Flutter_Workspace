import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main()
{
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget
{
  @override
  ShimmerState createState() => ShimmerState();

}

class ShimmerState extends State<MyApp>
{
  bool _enabled = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

        appBar: AppBar(title: Text("Shimmer Effect Example"),),
        body:Container(

          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column
            (
            mainAxisSize: MainAxisSize.max,
            children:
            [

              Expanded(child: Shimmer.fromColors
               (
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row
                          (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(()
                                    {
                                      _enabled = !_enabled;
                                    });
                                  },
                                  child: Text
                                    (
                                    _enabled ? 'Stop' : 'Play',
                                    )),
                            )
                          ],
                        ),
                      ),
                  itemCount: 6,
                ),
              ))
            ],
          ),
        )



    );
  }
}