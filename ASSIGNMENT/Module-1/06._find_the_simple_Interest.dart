// Q6. Write a program to find the simple Interest.

import 'dart:io';

void main()
{
  //Pass The Msg To Take User's Input
  print("Enter Principle : ");
  int p = int.parse(stdin.readLineSync()!);

  print("Enter Rate : ");
  int r = int.parse(stdin.readLineSync()!);

  print("Enter time : ");
  int t = int.parse(stdin.readLineSync()!);

  double interest = p * r * t / 100; // Formula TO Find Simple Interest
  print("Simple Interest Is $interest");
}