import 'dart:io';

void main()
{
  int ans;
  // printing the menu for the menu driven program
  print("1.addition\n2.Subtraction\n3.Multiplication\n4.divison");

  //Pass The Msg To Take User's Choice
  print("Enter Your Choice : ");
  int ch = int.parse(stdin.readLineSync()!);


  //Pass The Msg To Take User's Input
  print("\nEnter Number Of A : ");
  int no = int.parse(stdin.readLineSync()!);

  print("Enter Number Of B : ");
  int no1 = int.parse(stdin.readLineSync()!);

  // switch case
  switch(ch)
      {
  // case 1 for addition of two numbers
    case 1:
      ans = no + no1;
      print("\nAddition is = $ans");
      break;

    // case 2 for Subtraction of two numbers
    case 2:
      ans = no - no1;
      print("\nSubtraction Is = $ans");
      break;

    // case 2 for Multiplication of two numbers
    case 3:
      ans = no * no1;
      print("\nMultiplication Is = $ans");
      break;

  // case 2 for Divison of two numbers
    case 4:
      double ans = no / no1;
      print("\nDivision Is = $ans");
      break;

      default:
      print("Invalid Choice");
      break;
      }
}