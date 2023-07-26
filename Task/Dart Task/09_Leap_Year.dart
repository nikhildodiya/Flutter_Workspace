import 'dart:io';

void main()
{
  // pass THe Msg To Take User's Input
  print("Enter Any Year : ");
  int? year = int.parse(stdin.readLineSync()!);

  if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0) // Condition To Check Given Number Leap Year Or Not
    {
      print("Year Is Leap Year...");
    }
  else
    {
      print("Year Is Not Leap Year...");
    }
}