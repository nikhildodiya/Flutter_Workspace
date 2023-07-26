import 'dart:io';

void main()
{
  int i, fecto = 1;
  //Pass THe Msg To Take User's Input
  print("Enter ANy Number : ");
  int? no = int.parse(stdin.readLineSync()!);

  for(i=1; i<=no; i++) // loop
    {
      fecto = fecto * i; // Formula For Find Factorial Value
    }
  print("Given Number Factorial Is $fecto");
}