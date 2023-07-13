/*
Q. Print Below Pattern
     1
    2 2
   3 3 3
  4 4 4 4
 5 5 5 5 5
 */

import 'dart:io';

void main()
{
  int i,j,space;
  for(i=1; i<=5; i++)
  {
    for(space = 0; space != (5-i); space++)
    {
      stdout.write(" ");
    }
    for(j=5; j>space; j--)
    {
      stdout.write(" $i");
    }
    stdout.writeln();
  }
}