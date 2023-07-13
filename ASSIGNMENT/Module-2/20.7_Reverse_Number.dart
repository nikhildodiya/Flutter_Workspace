import 'dart:io';

void main()
{
  int lastdigit=0,rnum=0;


  print("Enter the number : ");
  int  num = int.parse(stdin.readLineSync()!);


  while (num >= 1)
  {
    if (num < 10)
      lastdigit = num;
    else
      lastdigit = num%10;

    rnum=(rnum*10)+lastdigit;
    num=(num/10).floor();
  }
  print("\nRevese Number is : $rnum");

}