void main() {
  // 1----


  int degree = 50;

  switch (degree ~/ 10) {
    case 10:
    case 9:
      print("Grade: A");
      break;
    case 8:
      print("Grade: B");
      break;
    case 7:
      print("Grade: C");
      break;
    case 6:
      print("Grade: D");
      break;
    default:
      print("Grade: F");
      break;
  }

  ////////////////////////////////////////////////////////////////////////

  // 2-----

  double num1 = 5.0;
  double num2 = 7.0;
  double num3 = 9.0;

  double average = (num1 + num2 + num3) / 3;

  print("The average of $num1, $num2, and $num3 is $average");


  ////////////////////////////////////////////////////////////////////////

  // 3-----

  int num9 = 5;
  int num10 = 7;

  if (num9 > num10) {
    print("$num9 is greater than $num10");
  } else if (num9 < num10) {
    print("$num9 is less than $num10");
  } else {
    print("$num9 is equal to $num10");
  }
}