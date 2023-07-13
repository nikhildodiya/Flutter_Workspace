//Write a program you have to make a summation of first and last Digit. (E.g. 1234 ans:-5)

import 'dart:io';

void main()
{
    double sum=0, firstDigit, lastDigit; // Variable To store The Value

     // Pass The Msg To Take Users Input
    print("Enter any number : ");
    double num = double.parse(stdin.readLineSync()!);

lastDigit = num % 10; // Formula To Find Last Digit
firstDigit = num;

  while(num >= 10) // Condition
    {
        num = num / 10;
    }
   firstDigit = num;

    sum = firstDigit + lastDigit;
// Paas The Msg To Take User's output
print("Sum of first and last digit =  $sum");
}
