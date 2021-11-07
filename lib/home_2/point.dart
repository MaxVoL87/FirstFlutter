// Dart imports:
import 'dart:math';

// Project imports:
import 'package:first_flutter/utils/double_ext.dart';

class Point {
  final double x;
  final double y;
  final double z;

  const Point(this.x, this.y, this.z);

  factory Point.origin() => const Point(0, 0, 0);

  factory Point.unitVector() => const Point(1, 1, 1);

  double distanceTo(Point another) {
    return sqrt(pow(x - another.x, 2) + pow(y - another.y, 2) + pow(z - another.z, 2));
  }

  static double triangleSquare(Point a, Point b, Point c) {
    final double sideA = b.distanceTo(c);
    final double sideB = a.distanceTo(c);
    final double sideC = a.distanceTo(b);
    final double halfPerim = (sideA + sideB + sideC) / 2;

    return sqrt(halfPerim * (halfPerim - sideA) * (halfPerim - sideB) * (halfPerim - sideC)).roundTo(10);
  }
}
