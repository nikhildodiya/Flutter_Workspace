/*
Q12. Print The Below Pattern
1
44
999
16161616
2525252525
*/

import 'dart:io';

void main()
{
  for(int i=1; i<=5; i++)
  {
    for(int j=1; j<=i; j++)
    {
      stdout.write(i*i);
    }
    stdout.writeln();
  }
}