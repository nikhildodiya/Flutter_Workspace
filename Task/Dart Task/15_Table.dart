import 'dart:io';

void main()
{
  // Pass The Msg To User's Input
  print("Enter Any Number : ");
  int? no = int.parse(stdin.readLineSync()!);

  for(int i = 1; i <= 10; i++) // loop
  {
    int result = no * i; //To get result of multiplication Of Given Number
    print('$no * $i = $result'); // Print Final Result
  }
}