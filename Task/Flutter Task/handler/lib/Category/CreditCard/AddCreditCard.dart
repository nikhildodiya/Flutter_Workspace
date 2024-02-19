import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:handler/Category/CreditCard/ViewCreditCard.dart';
import 'package:http/http.dart' as http;


class CreditCardAdd extends StatefulWidget
{
  @override
  _CreditCardAddState createState() => _CreditCardAddState();
}

class _CreditCardAddState extends State<CreditCardAdd>
{
  final _formKey = GlobalKey<FormState>();

  TextEditingController Holder_Name = TextEditingController();
  TextEditingController Card_Number = TextEditingController();
  TextEditingController CVV = TextEditingController();
  TextEditingController Pin = TextEditingController();


  String selectedBank = '';
  List<String> CreditCardBankList =
  [
    'HDFC Bank Credit Card',
    'SBI Card Credit Card',
    'American Express Credit Card',
    'ICICI Bank Credit Card',
    'Citibank Credit Card',
    'YES Bank Credit Card',
    'Standard Chartered Bank',
    'IndusInd Bank',
    'RBL Bank Credit Card',
    'Allahabad Bank Credit Card',
    'Andhra Bank Credit Card',
    'Axis Bank Credit Card',
    'Bajaj Finserv Credit Card',
    'Bank of Baroda Credit Card',
    'Bank of India Credit Card',
    'Bank of Maharashtra Credit Card',
    'Canara Bank Credit Card',
    'Central Bank of India Credit Card',
    'Corporation Bank Credit Card',
    'DCB Bank Credit Card',
    'Dhanlaxmi Bank Credit Card',
    'Federal Bank Credit Card',
    'HSBC Bank Credit Card',
    'IDBI Bank Credit Card',
    'Indian Bank Credit Card',
    'Jammu and Kashmir Bank Credit Card',
    'Karur Vysya Bank Credit Card',
    'Kotak Mahindra Bank Credit Card',
    'Nainital Bank Credit Card',
    'Oriental Bank of Commerce Credit Card',
    'Punjab National Bank Credit Card',
    'Tamilnad Mercantile Bank Credit Card',
    'Tata Capital Credit Card',
    'UCO Bank Credit Card',
    'Union Bank of India Credit Card',
    'Vijaya Bank Credit Card'
  ];


  @override
  Widget build(BuildContext context)
  {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Credit Card Login"),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children:
            [
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Credit Card Bank:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10), // Add some space between the text and the dropdown
                  Expanded(
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: TextEditingController(text: selectedBank),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_downward),
                          hintText: "Search Your Bank Here",
                        ),
                      ),

                      suggestionsCallback: (pattern) async
                      {
                        return CreditCardBankList.where((bank) => bank.toLowerCase().contains(pattern.toLowerCase()));
                      },
                      itemBuilder: (context, suggestion)
                      {
                        return ListTile
                        (
                          title: Text(suggestion),
                        );
                      },
                      onSuggestionSelected: (suggestion)
                      {
                        setState(()
                        {
                          selectedBank = suggestion;
                        });
                      },
                    ),
                  ),
                ],
              ),


              Container
                (
                padding: EdgeInsets.all(8.0),
                child: TextFormField
                  (
                  controller: Holder_Name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    prefixIcon: Icon(Icons.person),
                    hintText: "Card Holder Name",
                  ),

                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid Card Holder Name';
                    }
                    return null;
                  },
                ),
              ),

              Container(

                padding: EdgeInsets.all(8.0),
                child: TextFormField
                  (
                  controller: Card_Number,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.credit_card),
                    hintText: "Credit Card Number",
                  ),
                  inputFormatters:
                  [
                    FilteringTextInputFormatter.digitsOnly,
                    CreditCardNumberFormatter(),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please Enter Valid Credit Card Number';
                    }
                    return null;
                  },
                ),
              ),

              Container
                (
                  padding: EdgeInsets.all(8.0),
                  child: Row
                    (
                      children:
                      [
                        Expanded
                          (
                          child: TextFormField
                            (
                            controller: CVV,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration
                              (
                              prefixIcon: Icon(Icons.numbers),
                              hintText: "CVV",
                            ),
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return 'Please Enter Valid CVV';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(width: 16),
                        Expanded
                          (
                          child: TextFormField
                            (
                            controller: Pin,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration
                              (
                              prefixIcon: Icon(Icons.pin),
                              hintText: "Pin",
                            ),
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return 'Please Enter Valid Pin';
                              }
                              return null;
                            },
                            ),
                          ),
                      ],
                    ),
                ),

              SizedBox(height: 50),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
                  side: MaterialStateProperty.all<BorderSide>
                    (
                    BorderSide(color: Colors.grey), // Border color and width
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                  elevation: MaterialStateProperty.all<double>(4.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () async
                {
                  if (_formKey.currentState?.validate() ?? false)
                  {
                    var url = Uri.parse("https://nikhil2293.000webhostapp.com/API/Handler/handlercreditcard.php");
                    var response = await http.post(url,
                        body:
                        {
                          "selectedBank":selectedBank.toString(),
                          "Holder_Name":Holder_Name.text.toString(),
                          "Card_Number":Card_Number.text.toString(),
                          "CVV":CVV.text.toString(),
                          "Pin":Pin.text.toString(),
                        });

                    if (response.statusCode == 200)
                    {
                      // Registration successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Details Added successful", style: TextStyle(color: Colors.white),),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                      //_cleartext();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreditCard()));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Details Addition failed. Please try again.", style: TextStyle(color: Colors.white),),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black,
                        ),
                      );
                    }
                  }
                },
                child: Text("Save Data",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditCardNumberFormatter extends TextInputFormatter
{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length <= 16)
    {
      var newText = '';

      for (int i = 0; i < text.length; i++)
      {
        if (i != 0 && i % 4 == 0)
        {
          newText += '-';
        }
        newText += text[i];
      }

      return newValue.copyWith
        (
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
    return oldValue;
  }
}