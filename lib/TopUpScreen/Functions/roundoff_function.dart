String roundStringWith(String val) {
  var decimal = 2;
  double convertedTodDouble = double.parse(val);
  var number = convertedTodDouble.toStringAsFixed(decimal);
  return number;
}