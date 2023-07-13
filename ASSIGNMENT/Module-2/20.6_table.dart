// Q20.6 Write a program you have to print the table of given number.


import 'dart:io';

void main() //Main Method
{
      // Pass The Msg For Take User's Input
      print("Enter Your Number: ");
      int n = int.parse(stdin.readLineSync()!);

      for(int i = 1; i <= 10; i++)
          {
            int ans = n * i;
            print("$n x $i = $ans");
          }
}