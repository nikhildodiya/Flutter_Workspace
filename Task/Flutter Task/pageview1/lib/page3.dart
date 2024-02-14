import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewCustom  extends StatefulWidget
{
  @override
  customState createState() => customState();

}

class customState extends State <PageViewCustom>
{
  List<String> items = <String>['1', '2', '3', '4', '5'];

  void _reverse()
  {
    setState(()
    {
      items = items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(

      appBar: AppBar(title: Text("Page Build"),),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => _reverse(),
              child: Text('Reverse item'),
            ),
          ],
        ),
      ),
      body: PageView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
            return KeepAlive(
              //data: items[index],
              key: ValueKey<String>(items[index]),data: 'xyz',);
          },
          childCount: items.length,
          findChildIndexCallback: (Key key) {
            final Key valueKey = key;
            final String data = valueKey as String;
            return items.indexOf(data);
          },
        ),
      ),
    );
  }
}

class KeepAlive extends StatefulWidget
{
  const KeepAlive({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: Text('Page ${widget.data}'));
  }
}
