import 'dart:ffi';

main() {

  // 1---
  var fahrenheit = 50;
  var celsius = (fahrenheit - 32) * (5 / 9);

  print(celsius);

  ///////////////////////////////////////////////////////////

  // 2---

  double rad,area;

  rad = 10.0;

  area = 3.14 * rad * rad;
  print('Area of Circle is = $area');
}