import 'dart:io';

void main()
{
  print("Enter Any Number Of A : ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter Any Number Of B : ");
  int b = int.parse(stdin.readLineSync()!);

  print("Enter Any Number Of C : ");
  int c = int.parse(stdin.readLineSync()!);

  if(a>b && a>c)
    {
      print("\nMax Number Is A..");
    }
  else if(b>a && b>c)
    {
      print("\nMax Number Is B..");
    }
  else
    {
      print("\nMax Number Is C..");
    }
}