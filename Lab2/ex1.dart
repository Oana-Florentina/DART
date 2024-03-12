void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('No numbers provided.');
    return;
  }

  List<int> numbers = [];

  for (String arg in arguments) {
    try {
      int number = int.parse(arg);
      numbers.add(number);
    } catch (e) {
      print('Invalid number: $arg');
      return;
    }
  }

  List<int> incremented = incrementNumber(numbers);
  print(incremented);
}

List<int> incrementNumber(List<int> numbers) {
  int carry = 1;
  List<int> result = [];

  for (int i = numbers.length - 1; i >= 0; i--) {
    int sum = numbers[i] + carry;
    result.insert(0, sum % 10);
    carry = sum ~/ 10;
  }

  if (carry > 0) {
    result.insert(0, carry);
  }

  return result;
}
