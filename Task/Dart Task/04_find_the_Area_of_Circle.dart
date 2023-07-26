import 'dart:io';

void main()
{
  print("Enter Area Of Circle : "); // Pass The Msg To Take user's input
  int? r = int.parse(stdin.readLineSync()!);

  double area = 3.14 * r * r; // Formula of Circle
  print("Area Of Circle Is $area"); // Pass The Msg To Take Users Output
}