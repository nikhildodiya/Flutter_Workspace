import 'dart:io';

void main()
{
  // Pass The Msg To Take User's Input
  print("Enter Maths Subject Mark : ");
  int maths = int.parse(stdin.readLineSync()!);

  print("Enter Science Subject Mark : ");
  int science = int.parse(stdin.readLineSync()!);

  print("Enter Social Science Subject Mark : ");
  int social = int.parse(stdin.readLineSync()!);

  print("Enter Gujarati Subject Mark : ");
  int gujarati = int.parse(stdin.readLineSync()!);

  print("Enter Hindi Subject Mark : ");
  double hindi = double.parse(stdin.readLineSync()!);

  double total =  maths + science + social + gujarati + hindi; // Formula For To Get Total OF 5 Subject
  print("Five Subjects Mark Is : $total");

  double p = total / 500 * 100; // To Find Percentage OF 5 Subject
  print("Percentage is $p");

  if(p < 35)
    {
      print("Your Are Fail.. Better Luck Next Time...");
    }

  if(p > 35 && p <= 50)
    {
      print("You Got Pass Class");
    }
  if(p > 50 && p <=60)
    {
      print("You Got Second Class");
    }
  if(p > 60 && p <= 75)
    {
      print("You Got First Class");
    }
  if(p > 75)
    {
      print("Congratulations.... You Got Distinction");
    }
}