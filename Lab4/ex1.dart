/*Scrieti o functie care primeste ca parametru un String si o lista 
de expresii regulate si returneaza o lista de stringuri care fac match pe 
cel putin una dintre expresiile regulate primite ca parametru.*/

List<String> matchExpressions(String input, List<RegExp> regexList) {
  List<String> matches = [];
  
  for (RegExp regex in regexList) {
    Iterable<Match> allMatches = regex.allMatches(input);
    for (Match match in allMatches) { 
      matches.add(match.group(0)!); 
    }
  }
  
  return matches;
}

void main() {
  String text = "Acesta este un text de test pentru a găsi match-uri cu expresii regulate.";
  List<RegExp> regexList = [
    RegExp(r'\b[Aa]\w+\b'),  // cuv incep cu litera 'A' sau 'a'
    RegExp(r'\b[tT]\w+\b'),  // ..'T' sau 't'
    RegExp(r'\b\w{5,}\b')    // ..cel putin 5 caractere
  ];
  
  List<String> matchedStrings = matchExpressions(text, regexList);
  print(matchedStrings);
}
