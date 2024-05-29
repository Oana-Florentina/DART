import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Category { dulce, legume, fructe }

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shopping List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  Category _selectedCategory = Category.dulce;

  final List<Map<String, dynamic>> _shoppingList = [];
  final List<Category> _categoryList = [];

  Timer? _timer;
  int _colorRotationIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _colorRotationIndex = (_colorRotationIndex + 1) % 3;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _addItemToList(String newItem, Category category) {
    setState(() {
      if (newItem.isNotEmpty) {
        _shoppingList.add({
          'item': newItem,
          'category': category,
        });
        if (!_categoryList.contains(category)) {
          _categoryList.add(category);
        }
        _controller.clear();
      }
    });
  }

  void _removeItemFromList(int index) {
    setState(() {
      _shoppingList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Add item',
              contentPadding: EdgeInsets.all(10),
            ),
          ),
          DropdownButton<Category>(
            value: _selectedCategory,
            onChanged: (Category? newValue) {
              setState(() {
                _selectedCategory = newValue!;
              });
            },
            items: Category.values.map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(
                  category.toString().split('.').last,
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _shoppingList.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomPaint(
                  painter: CategoryPainter(
                    _shoppingList[index]['category'],
                    _generateColorForCategory(_shoppingList[index]['category']),
                  ),
                  child: Card(
                    child: InkWell(
                      onDoubleTap: () => _removeItemFromList(index),
                      hoverColor: Colors.red,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _shoppingList[index]['item'],
                              style: const TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItemToList(_controller.text, _selectedCategory);
        },
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ), floatingActionButtonFavorite: null,
    );
  }

  Color _generateColorForCategory(Category category) {
    switch (category) {
      case Category.dulce:
        return _generateColor(0);
      case Category.legume:
        return _generateColor(1);
      case Category.fructe:
        return _generateColor(2);
      default:
        return Colors.white;
    }
  }

  Color _generateColor(int index) {
    List<Color> palette = [Colors.yellow, Colors.green, Colors.orange];
    return palette[(_colorRotationIndex + index) % palette.length];
  }
}

class CategoryPainter extends CustomPainter {
  final Category? category;
  final Color? color;

  CategoryPainter(this.category, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color!;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}