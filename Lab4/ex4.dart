/*Implementanti Map<String,dynamic> jsonSubJson(String jsonPath1, String jsonPath2),
 unde jsonPath1 si jsonPath2 sunt path-uri catre doua fisiere json. Operatia de scadere 
 intre 2 fisiere json ar trebui sa rezulte intr-un json fara nodurile comune. Functia va fi 
 scrisa intr-o librarie separata de cea din care va fi apelata.*/

import 'fisierul.dart';

void main() {
  final jsonPath1 = 'fisier1.json';
  final jsonPath2 = 'fisier2.json';

  final result = jsonSubJson(jsonPath1, jsonPath2);
  print(result);
}
