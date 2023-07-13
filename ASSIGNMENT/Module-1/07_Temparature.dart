// Q7. Write a program to convert temperature from degree centigrade to Fahrenheit.

import 'dart:io';

void main() // Main Method
{
  // Pass THe Msg TO Take Users Input
  print("Enter Celsius : ");
  double cel = double.parse(stdin.readLineSync()!);

  // Formula To Fahrenheit Value From Celsius
  double f = (cel * 9 / 5) + 32;
  print("Fahrenheit Is $f");
}