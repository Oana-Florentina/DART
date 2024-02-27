/*Write a dart function that converts a string of characters 
written in UppeCamelCase into lowercase_with_underscore.*/

String convertToLowercase_with_underscore(String input) {
  String result = '';
  for (int i = 0; i < input.length; i++) {
    if (input[i] == input[i].toUpperCase()) {
      if (i != 0) {
        result += '_';
      }
      result += input[i].toLowerCase();
    } else {
      result += input[i];
    }
  }
  return result;
}

void main() {
  String input = 'UppeCamelCase';
  print('The lowercase_with_underscore of $input is: ${convertToLowercase_with_underscore(input)}');
}