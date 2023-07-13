/*
Q. Print The Below Patter
          1
         1 2
        1 2 3
       1 2 3 4
      1 2 3 4 5
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
    for(j=1; j<=i; j++)
    {
      stdout.write(" $j");
    }
    stdout.writeln();
  }
}