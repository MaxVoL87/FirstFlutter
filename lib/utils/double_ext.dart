extension DoubleExt on double {
  double roundTo(double precision) => (this * precision).round() / precision;
}
