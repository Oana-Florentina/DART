class MathOps<T, G> {
  int sub(T obj1, G obj2) {
    final val1 = _parseValue(obj1);
    final val2 = _parseValue(obj2);
    return val1 - val2;
  }

  int prod(T obj1, G obj2) {
    final val1 = _parseValue(obj1);
    final val2 = _parseValue(obj2);
    return val1 * val2;
  }

  int mod(T obj1, G obj2) {
    final val1 = _parseValue(obj1);
    final val2 = _parseValue(obj2);
    return val1 % val2;
  }

  int _parseValue(dynamic obj) {
    if (obj is int || obj is double) {
      return obj.toInt(); 
    } else if (obj is String && int.tryParse(obj) != null) {
      return int.parse(obj);
    } else {
      throw ArgumentError("Cannot parse $obj as a number");
    }
  }
}

void main() {
  var mathOps = MathOps();

  print(mathOps.prod(5, 3)); 
  print(mathOps.mod(5, 3)); 

  print(mathOps.sub(5.5, 3.5)); 
  print(mathOps.prod(5.5, 3.5)); 
  

  print(mathOps.prod("123", 3)); 
  print(mathOps.prod(5, "123")); 
}
