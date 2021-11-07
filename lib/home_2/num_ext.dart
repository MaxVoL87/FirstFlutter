extension NumExt on num {
  /// throws [ArgumentError]
  num rootOfPower(int root) {
    if(this < 0 && root % 2 == 0) throw ArgumentError('Unable to return value. Can\'t get value if this number < 0 and root degree is an even number', 'root');

    num x, pw, xprev = 1;
    x = this;
    while ((xprev - x).abs() > 1.0e-10) {
      xprev = x;
      pw = 1;
      for (int i = 0; i < (root - 1); i++) {
        pw *= xprev;
      }
      x = 1.0 / root * ((root - 1) * xprev + this / pw);
    }
    return x;
  }
}
