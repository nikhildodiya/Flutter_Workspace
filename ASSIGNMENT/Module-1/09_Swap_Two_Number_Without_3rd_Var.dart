import 'dart:io';

void main()
{
  print("Enter Number A : ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter Number B : ");
  int b = int.parse(stdin.readLineSync()!);

  a = a+b;
  b = a-b;
  a = a-b;

  print("\n---------After Swapping------------");
  print("\nValue Of A $a");
  print("Value Of B $b");
}