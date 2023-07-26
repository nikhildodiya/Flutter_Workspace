import 'dart:io';

void main()
{
  // Pass The Msg To Take User's Input
  print("Enter Maths Subject Mark : ");
  int? maths = int.parse(stdin.readLineSync()!);

  print("Enter Science Subject Mark : ");
  int? science = int.parse(stdin.readLineSync()!);

  print("Enter Social Science Subject Mark : ");
  int? social = int.parse(stdin.readLineSync()!);

  print("Enter Gujarati Subject Mark : ");
  int? gujarati = int.parse(stdin.readLineSync()!);

  print("Enter Hindi Subject Mark : ");
  double? hindi = double.parse(stdin.readLineSync()!);

  double total =  maths + science + social + gujarati + hindi; // Formula For To Get Total OF 5 Subject
  print("Five Subjects Mark Is : $total");

  double persantage = total / 500 * 100; // To Find Persantage OF 5 Subject
  print("Persantage is $persantage");
}