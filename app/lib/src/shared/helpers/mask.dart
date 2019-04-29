String money(
  double value, {
  String decimalSeparator = ",",
  String thousandSeparator = ".",
  String initialSymbol = "R\$",
}) {
  String textRepresentation =
      value.toStringAsFixed(2).replaceAll('.', decimalSeparator);

  List<String> numberParts = [];

  for (var i = 0; i < textRepresentation.length; i++) {
    numberParts.add(textRepresentation[i]);
  }

  const lengthsWithThousandSeparators = [6, 10, 14, 18];

  for (var i = 0; i < lengthsWithThousandSeparators.length; i++) {
    var l = lengthsWithThousandSeparators[i];

    if (numberParts.length > l) {
      numberParts.insert(numberParts.length - l, thousandSeparator);
    } else {
      break;
    }
  }

  String numberText = numberParts.join('');

  return "$initialSymbol $numberText";
}

String percentage(double val) {
  return "${val.toStringAsFixed(2)}%";
}
