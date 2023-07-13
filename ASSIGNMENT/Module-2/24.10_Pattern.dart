/*
Q. Print The Below Pattern
1
01
101
1010
10101
*/



import 'dart:io';

void main() {
  print("Enter a number:");
  int n = int.parse(stdin.readLineSync()!);

  int i, j;
  for (i = 1; i <= n; i++) {
    for (j = 1; j <= i; j++) {
      if (i == 2 && j == 2) {
        stdout.write("1");
      }
      else if (i == 2 && j == 1 || j % 2 == 0) {
        stdout.write("0");
      }
      else {
        stdout.write("1");
      }
    }
    stdout.writeln();
  }
}