import 'dart:io';

void main()
{
      int rev = 0; //Variable to store the value

      // Pass The msg to take user's input
      print("Enter Your Number :");
      int? n = int.parse(stdin.readLineSync()!);

      while(n != 0) // calculating reverse number to given number
        {
          int r = n % 10;
            rev = rev * 10 + r;
             n = n/10;
        }
        print("reversed number : $rev");
}