/*Write a dart function that extracts all the numbers from a text. 
The numbers can be double or int. The program will return the sum of the extracted numbers.*/


double sumNumbers(String text) {
  RegExp numberRegExp = RegExp(r'-?\d+(\.\d+)?'); 
  Iterable<Match> matches = numberRegExp.allMatches(text);
  double sum = 0;

  for (Match match in matches) {
    String numberStr = match.group(0)!;
    double number = double.parse(numberStr);
    sum += number;
  }
  return sum;
}

void main() {
  String text = "Write 5 dart . funct10n that extracts all 13.03the numbers from a text.";
  print('The sum of the numbers in the text is: ${sumNumbers(text)}');
}
