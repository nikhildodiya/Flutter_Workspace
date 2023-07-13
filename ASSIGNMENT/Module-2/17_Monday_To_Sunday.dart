// Q17. Write Program use switch statement. Display Monday to Sunday

import 'dart:io';

void main()
{

print("\n1.Monday\n2.tuesday\n3.Wednesday\n4.thursday\n5.Friday\n6.Saturday\n7.Sunday\n");

print("\nEnter Your Day : ");
int days = int.parse(stdin.readLineSync()!);

switch(days)
{
case 1:
print("monday");
break;

case 2:
print("Tuesday");
break;

case 3:
print("Wednesday");
break;

case 4:
print("Thursday");
break;

case 5:
print("Friday");
break;

case 6:
print("Saturday");
break;

case 7:
print("Sunday");
break;

default:
print("\nInvalid Input...");
break;
}
}