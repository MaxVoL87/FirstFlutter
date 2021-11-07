// Dart imports:
import 'dart:collection';
import 'dart:core';
import 'dart:math' hide Point;

// Project imports:
import 'package:first_flutter/home_2/num_ext.dart';
import 'package:first_flutter/home_2/point.dart';
import 'package:first_flutter/home_2/user.dart';
import 'package:first_flutter/home_2/user_manager.dart';

class Home2 {

  void run() {

    // #1
    print(_gcd(100, 16));
    print(_lcm(100, 16));
    print(_getMultipliers(100));

    // #2
    print(_toBinaryString(100));
    try {
      print(_fromBinaryString('1100100'));
    } on FormatException {
      print('argument not a binary number');
    }

    // #3
    print(_getNumbers('bi2nary Nu3mber'));

    // #4
    print(_frequency(['test', 'test2', 'test1', 'test2', 'test1', 'test', 'test2', 'test2']));
    
    // #5
    print(_getWordNumbers(['one', 'test', 'zero', 'nine', 'test2', 'three']));

    // #6
    print(Point.origin().distanceTo(const Point(1, 1, 0)));
    print(Point.triangleSquare(const Point(1,1,0), const Point(3, 2, 0), const Point(3, 4, 0)));

    // #7
    print(1234.rootOfPower(2));

    // #8
    final UserManager userManager = UserManager()
      ..add(GeneralUser('user@mail.ru'))
      ..add(AdminUser('admin@mail.ru'))
      ..add(GeneralUser('general@mail.ru'));
    print(userManager.getEmails());

    userManager.removeLast();
    print(userManager.getEmails());
  }
}


int _gcd(int a, int b) {
  return b != 0 ? _gcd(b, a % b) : a.abs();
}

int _lcm(int a, int b) {
  return a ~/ _gcd(a, b) * b;
}

List<int> _getMultipliers(int number) {
  final List<int> result = List.empty(growable: true);

  int curNum = number;
  int probe = 2;
  while (curNum != 1) {
    if (curNum % probe != 0) {
      probe++;
    } else {
      curNum ~/= probe;
      result.add(probe);
    }
  }
  return result;
}

String _toBinaryString(int number) {
  final List<int> result = List.empty(growable: true);

  int curNum = number;
  int probe = 2;
  while (curNum != 0) {
    var del = curNum / probe;
    curNum = del.truncate();
    result.insert(0, del - curNum != 0 ? 1 : 0);
  }
  return result.join();
}

/// Throws [FormatException] if binaryNumber not a binary number
int _fromBinaryString(String binaryNumber) => binaryNumber.split("")
    .reversed
    .map((e) => int.parse(e))
    .toList()
    .asMap()
    .entries
    .map((entry) => pow(2, entry.key).toInt() * entry.value)
    .reduce((value, element) => value + element);

List<num> _getNumbers(String text) =>
    text.split("").map((e) => num.tryParse(e)).whereType<num>().toList();

Map<String, int> _frequency(List<String> strings) {
  final Map<String, int> result = HashMap();

  for (var element in strings) {
    result[element] = (result[element] ?? 0) + 1;
  }
  return result;
}

final Map<String, int> _wordNumberMap = {
  "zero": 0,
  "one": 1,
  "two": 2,
  "three": 3,
  "four": 4,
  "five": 5,
  "six": 6,
  "seven": 7,
  "eight": 8,
  "nine": 9
};

List<int> _getWordNumbers(List<String> words) =>
    words.map((e) => _wordNumberMap[e]).whereType<int>().toList();
