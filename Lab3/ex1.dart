class Queue {
  List<dynamic> _elements = [];

  // Add an element to the back of the queue
  void push(dynamic element) {
    _elements.add(element);
  }

  // Remove and return the element at the front of the queue
  dynamic pop() {
    if (_elements.isEmpty) {
      throw 'Queue is empty';
    }
    return _elements.removeAt(0);
  }

  // Return the element at the front of the queue without removing it
  dynamic front() {
    if (_elements.isEmpty) {
      throw 'Queue is empty';
    }
    return _elements[0];
  }

  // Return the element at the back of the queue without removing it
  dynamic back() {
    if (_elements.isEmpty) {
      throw 'Queue is empty';
    }
    return _elements[_elements.length - 1];
  }

  // Check if the queue is empty
  bool isEmpty() {
    return _elements.isEmpty;
  }

  @override
  String toString() {
    return _elements.toString();
  }
}

void main() {
  Queue myQueue = Queue();

  print('Pushing elements to the queue:');
  myQueue.push(1);
  myQueue.push(2);
  myQueue.push(3);
  print('Queue: ${myQueue}');

  print('\nRemoving element from the front of the queue:');
  print('Popped element: ${myQueue.pop()}');
  print('Queue: ${myQueue}');

  print('\nFront element of the queue: ${myQueue.front()}');
  print('Back element of the queue: ${myQueue.back()}');

  print('\nIs the queue empty? ${myQueue.isEmpty()}');
}
