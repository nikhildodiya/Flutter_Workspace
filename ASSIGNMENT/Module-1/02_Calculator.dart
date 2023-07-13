// Q2. Write a program to make addition, Subtraction, Multiplication and Division of Two Numbers.

import 'dart:io';

void main()
{
  //Pass The Msg To Take User's Output
  print("Enter First Number : ");
  int? no1 = int.parse(stdin.readLineSync()!);

  print("Enter Second Number : ");
  int? no2 = int.parse(stdin.readLineSync()!);

  //Addition
  int add = no1 + no2;
  print("Addition is $add");

  //Subtraction
  int sub = no1 - no2;
  print("Subtraction is $sub");

  //Multiplication
  int mul = no1 * no2;
  print("Multiplication is $mul");

  //Division
  double div = no1 / no2;
  print("Division Is $div");
}