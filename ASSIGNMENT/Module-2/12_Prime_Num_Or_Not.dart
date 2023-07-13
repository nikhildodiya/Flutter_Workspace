// Q12. Write a Program to check the given number is prime or not prime.


import 'dart:io';

void main() //Main Method
{
  double  c = 0; // Variable

  // Pass The Msg To User's Input
  print("Enter Any Number : ");
  double n = double.parse(stdin.readLineSync()!);

  for(double i = 0; i <= n; i++) // For Loop
    {
      if(n % i == 0) // If Condition To Check given number == 0 or not
        {
          c++;
        }
    }
  if(c==2)
    {
      print("Given Number Is Prime Number");
    }
  else
    {
      print("Given Number Is Not Prime Number");
    }
}