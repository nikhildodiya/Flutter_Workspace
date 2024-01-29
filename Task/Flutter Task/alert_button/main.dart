void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp
      (

      home: Scaffold(
        appBar: AppBar
          (
          title: Text("Dialogs"),
        ),
        body: MyAlert(),
      ),
    );
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center
      (

      child: Column
        (

        children:
        [

          ElevatedButton(onPressed: ()
          {
            showAlertDialog(context);

          }, child: Text("Simple Alert")),

          ElevatedButton(onPressed: ()
          {
            _asyncConfirmDialog(context);

          }, child: Text("Confirm Alert"))




        ],



      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

enum ConfirmAction { Cancel, Accept}
_asyncConfirmDialog(BuildContext context)
{
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete This Contact?'),
        content: const Text(
            'This will delete the contact from your device.'),


        actions: [
          TextButton
            (
            child: const Text('Cancel'),
            onPressed: ()
            {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          TextButton
            (
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}