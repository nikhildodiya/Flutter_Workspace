import 'dart:io';

void main()
{
  //Pass The Msg To Tale User's Input
  print("Enter a number:");
  double? num = double.parse(stdin.readLineSync()!);

  if(num > 0) // Condition To Check Given Number Greater Then 0 Or Not
  {
    print("Number is positive");
  }
  else if(num < 0) // Condition To Check Given Number Less Then 0 Or Not
  {
    print("Number is negative");
  }
  else
  {
    print("Number is Zero");
  }
}