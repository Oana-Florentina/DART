import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final TextEditingController _controller = TextEditingController();
  
  final List<String> _shoppingList = [];


  void _addItemToList() {
    setState(() {
      final newItem = _controller.text.trim();
      if (newItem.isNotEmpty) {
        _shoppingList.add(newItem);
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
            onSubmitted: (_) => _addItemToList(),
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
                return Card(
                  child: InkWell(
                    onDoubleTap: () => _removeItemFromList(index),
                  
                    hoverColor: Colors.red,
                    child: Center(
                      child: Text(
                        _shoppingList[index],
                        style: const TextStyle(fontSize: 20.0), 

                        
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
        onPressed: _addItemToList,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ), 


    );
  }
}
