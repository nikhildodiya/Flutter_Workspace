/* Q10. Print Below Pattern
1
2 3
4 5 6
7 8 9 10
11 12 13 14 15 */


import 'dart:io';

void main()
{
  int c = 0;

  for(int i=1; i<=5; i++)
    {
      for(int j = 1; j<=i; j++ )
        {
          c++;
          stdout.write("$c ");
        }
      stdout.writeln();
    }
}