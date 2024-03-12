void main(List<String> arguments) {
  if (arguments.length % 2 != 1) {
    print('Invalid input format.');
    return;
  }

  Map<String, int> letterValues = {};

  for (int i = 0; i < arguments.length - 1; i += 2) {
    String letter = arguments[i];
    String valueStr = arguments[i + 1];
    try {
      int value = int.parse(valueStr);
      letterValues[letter] = value;
    } catch (e) {
      print('Invalid number: $valueStr');
      return;
    }
  }

  String word = arguments.last;
  int sum = 0;
  for (int i = 0; i < word.length; i++) {
    String letter = word[i];
    if (letterValues.containsKey(letter)) {
      sum += letterValues[letter]!;
    } else {
      print('Letter not found: $letter');
      return;
    }
  }

  print('Suma numerelor asociate cuvântului este: $sum');
}
