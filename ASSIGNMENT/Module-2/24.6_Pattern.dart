/*
Q. Print The Below Pattern
        *
       * *
      * * *
     * * * *
    * * * * *
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
    for(j = 1; j <= i; j++)
    {
      stdout.write(" *");
    }
    stdout.writeln();
  }
}