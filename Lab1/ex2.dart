/*Write a DART program that extracts all words from a phrase. 
A word is considered to be formed out of letters and numbers. 
Words are separated one from another with one or multiple spaces or punctuation marks.*/

void main() {
  String phrase = "Write a DART program that extracts all words from a phrase. ";
  List<String> words = [];
  for (String word in phrase.split(RegExp(r'[^a-zA-Z0-9]+'))) {
    if (word.isNotEmpty) {
      words.add(word);
    }
  }
  print(words);
}
