import 'dart:io';

void main()
{
int n, a = 0, b = 1, i, c;

      // Pass The Msg To take User Input
      print("Enter Your Number : ");
      int? no = int.parse(stdin.readLineSync()!);

      for(i = 1; i <= no; i++) // loop
      {
        print(a);
        c = a + b;
        a = b;
        b = c;
      }
}