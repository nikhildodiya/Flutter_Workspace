import 'dart:io';

void main()
{
  double i, fecto = 1;
  //Pass THe Msg To Take User's Input
  print("Enter ANy Number : ");
  double no = double.parse(stdin.readLineSync()!);

  for(i=1; i<=no; i++) // loop
    {
      fecto = fecto * i; // Formula For Find Factorial Value
    }
  print("Given Number Factorial Is $fecto");
}