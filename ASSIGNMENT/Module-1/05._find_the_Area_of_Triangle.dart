// Q5. Write a program to find the Area of Triangle

import 'dart:io';

void main()
{
  //Pass The Msg To Tale User's Input
  print("Enter Base and Height Of Triangle : ");
  int b = int.parse(stdin.readLineSync()!);
  int h = int.parse(stdin.readLineSync()!);

  int area = b * h; //Formula For Check Area Of Triangle
  // Pass The Msg To Take Users Output
  print("Area Of Triangle Is $area");
}