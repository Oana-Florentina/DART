/*Implementati o Stiva folosind fisiere ca storage.*/


import 'dart:io';

class FileStack {
  final String directoryPath;
  final String fileExtension;
  int _size;

  FileStack(this.directoryPath, this.fileExtension)
      : _size = 0;

  // Verifică dacă stiva este goală
  bool get isEmpty => _size == 0;

  // Adaugă un element în stivă
  void push(dynamic data) {
    _size++;
    File('$directoryPath/$_size$fileExtension').writeAsStringSync(data.toString());
  }

  // Extrage un element din stivă
  dynamic pop() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }

    final file = File('$directoryPath/$_size$fileExtension');
    final data = file.readAsStringSync();
    file.deleteSync();
    _size--;
    return data;
  }

  // Returnează elementul din vârful stivei fără a-l elimina
  dynamic peek() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }

    final file = File('$directoryPath/$_size$fileExtension');
    return file.readAsStringSync();
  }
}

void main() {
  final stack = FileStack('.', '.txt');

  stack.push('Item 1');
  stack.push('Item 2');
  stack.push('Item 3');

  //print(stack.pop()); 
  //print(stack.peek()); 
  print(stack.pop()); 
}
