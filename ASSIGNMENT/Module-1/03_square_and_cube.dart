// Q3. Write a program to make a square and cube of number.

import 'dart:io';

void main()
{
  print("Enter a number"); // Prompting the user to enter a number.

  int no = int.parse(stdin.readLineSync()!);

  int square = no * no; // Calculating the square of number
  print("square of number is $square");

  int cube = no * no * no; // Calculating the Cube Of Number
  print("cube of number is $cube");
}