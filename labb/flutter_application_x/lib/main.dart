import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteList(),
      child: const MyApp(),
    ),
  );
}

enum Category { dulce, legume, fructe }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  void initState() { //pot face asta o data pe zi pt meniul zilei 
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
            onSubmitted: (String value) {
              _addItemToList(value, _selectedCategory);
            },
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
          Consumer<FavoriteList>(
            builder: (context, favoriteList, child) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: _shoppingList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _shoppingList[index]['item'];
                    final category = _shoppingList[index]['category'];
                    final isFavorite = favoriteList.favorites.contains(item);

                    return CustomPaint(
                      painter: CategoryPainter(
                        category,
                        _generateColorForCategory(category),
                      ),
                      child: Card(
                        child: InkWell(
                          onDoubleTap: () => _removeItemFromList(index),
                          hoverColor: const Color.fromARGB(255, 228, 151, 146),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item,
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (isFavorite) {
                                      favoriteList.removeFromFavorites(item);
                                    } else {
                                      favoriteList.addToFavorites(item);
                                    }
                                  },
                                  icon: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  FavoritePage()));
        },

       

        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
      
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

class FavoriteList extends ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addToFavorites(String item) {
    _favorites.add(item);
    notifyListeners();
  }

  void removeFromFavorites(String item) {
    _favorites.remove(item);
    notifyListeners();
  }
}


class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
      ),
      body: Consumer<FavoriteList>(
        builder: (context, favoriteList, child) {
          return ListView.builder(
            itemCount: favoriteList.favorites.length,
            itemBuilder: (BuildContext context, int index) {
              final item = favoriteList.favorites[index];
              return ListTile(
                title: Text(item),
                trailing: IconButton(
                  onPressed: () {
                    favoriteList.removeFromFavorites(item);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}