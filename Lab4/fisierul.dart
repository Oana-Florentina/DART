 import 'dart:convert';
import 'dart:io';

Map<String, dynamic> jsonSubJson(String jsonPath1, String jsonPath2) {

  final jsonString1 = File(jsonPath1).readAsStringSync();
  final jsonString2 = File(jsonPath2).readAsStringSync();


  final Map<String, dynamic> json1 = json.decode(jsonString1);
  final Map<String, dynamic> json2 = json.decode(jsonString2);


  final Map<String, dynamic> result = {};
  json1.forEach((key, value) {
    if (!json2.containsKey(key)) {
      result[key] = value;
    }
  });

  return result;
}
