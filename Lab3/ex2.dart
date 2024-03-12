// Implement a class with a fromXml() constructor + toXml().
import 'package:xml/xml.dart';

class Example {
  int varA= 0;
  int varB =0;
  String varC ='';
  List<int> varD =[];
  double varE =0.0;

  Example(this.varA, this.varB, this.varC, this.varD, this.varE);

  String toXml() {
    var builder = XmlBuilder();
    builder.element('Example', nest: () {
      builder.element('varA', nest: varA);
      builder.element('varB', nest: varB);
      builder.element('varC', nest: varC);
      builder.element('varD', nest: () {
        for (var i in varD) {
          builder.element('varD', nest: i);
        }
      });
      builder.element('varE', nest: varE);
    });
    return builder.buildDocument().toXmlString(pretty: true);
  }

  Example.fromXml(String xmlString) {
    var root = XmlDocument.parse(xmlString).rootElement;
    varA = int.parse(root.findElements('varA').single.innerText);
    varB = int.parse(root.findElements('varB').single.innerText);
    varC = root.findElements('varC').single.innerText;
    varD =
        root.findElements('varD').single.findElements('varD').map((e) => int.parse(e.innerText)).toList();
    varE = double.parse(root.findElements('varE').single.innerText);

  }
}

void main() {
  var example = Example(1, 2, '3', [4, 5, 6], 7.0);
  print(example.toXml());
  var example2 = Example.fromXml(example.toXml());
  print(example2.toXml());
}
