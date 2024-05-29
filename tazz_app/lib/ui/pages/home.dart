// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tazz_app/domain/restaurant.dart';
import 'package:tazz_app/domain/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String username = 'Florentina';

  final List<Restaurant> _restaurants = <Restaurant>[
    Restaurant(name: 'KFC', category: Category.FastFood, products: {
      'Chicken Bucket': 19.99,
      'Chicken Sandwich': 5.99,
      'Chicken Tenders': 7.99,
    }),
    Restaurant(name: 'Starbucks', category: Category.CoffeeShop, products: {
      'Cappuccino': 3.99,
      'Latte': 4.99,
      'Mocha': 5.99,
    }),
    Restaurant(name: 'Pizza Hut', category: Category.PizzaPlace, products: {
      'Pepperoni Pizza': 12.99,
      'Cheese Pizza': 10.99,
      'Veggie Pizza': 11.99,
    }),
    Restaurant(name: 'Chipotle', category: Category.MexicanFood, products: {
      'Burrito': 7.99,
      'Taco': 2.99,
      'Bowl': 8.99,
    }),
    Restaurant(name: 'Partigiano', category: Category.PizzaPlace, products: {
      'Margherita Pizza': 9.99,
      'Quattro Stagioni Pizza': 12.99,
      'Quattro Formaggi Pizza': 11.99,
    }),
    Restaurant(name: 'McDonalds', category: Category.FastFood, products: {
      'Big Mac': 4.99,
      'Cheeseburger': 1.99,
      'McChicken': 3.99,
    }),
    Restaurant(name: 'Dunkin Donuts', category: Category.CoffeeShop, products: {
      'Donut': 1.99,
      'Coffee': 2.99,
      'Muffin': 1.99,
    }),
    Restaurant(name: 'Taco Bell', category: Category.MexicanFood, products: {
      'Quesadilla': 5.99,
      'Nachos': 4.99,
      'Chalupa': 3.99,
    }),
  ];

  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = username;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Widget buildFavoriteRestaurants() {
    int favoriteCount = 0;
    for (int i = 0; i < _restaurants.length; i++) {
      if (_restaurants[i].isFavorite) {
        favoriteCount++;
      }
    }
    return ListView.builder(
      itemCount: favoriteCount,
      itemBuilder: (BuildContext context, int index) {
        int selectedIndex = 0;
        Restaurant selectedRestaurant = _restaurants[0];
        for (int i = 0, j = 0; i < _restaurants.length; i++) {
          if (_restaurants[i].isFavorite) {
            if (j == index) {
              selectedIndex = i;
              selectedRestaurant = _restaurants[i];
              break;
            }
            j++;
          }
        }

        return Card(
          child: ListTile(
              title: Text(selectedRestaurant.name),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _restaurants[selectedIndex].isFavorite = false;
                  });
                },
              )),
        );
      },
    );
  }

  Widget buildProfilePage() {
    // Profile page
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                username = _usernameController.text;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Username updated')),
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget buildCart() {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Cart page',
          ),
        ),
      ),
    );
  }

  Widget buildHistory() {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'History page',
          ),
        ),
      ),
    );
  }

  Widget buildRestaurants() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Maximum 4 items per line
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75, // Adjust as needed for your design
        ),
        itemCount: _restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          bool isFavorite = _restaurants[index].isFavorite;

          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      _restaurants[index].name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Category: ${_restaurants[index].category.name}'),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isFavorite) {
                          _restaurants[index].isFavorite = false;
                        } else {
                          _restaurants[index].isFavorite = true;
                        }
                      });
                    },
                  ),
                  onTap: () {
                    // Handle the restaurant card tap
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Tapped on ${_restaurants[index].category.toString()}')),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Favorite Restaurants',
          ),
          Expanded(child: buildFavoriteRestaurants()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Find',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        // Home page (Favorites list)
        buildHomePage(),

        // Find page (grid of restaurants)
        buildRestaurants(),

        // Cart page (placeholder)
        buildCart(),

        // History page (placeholder)
        buildHistory(),

        // Profile page
        buildProfilePage()
      ][currentPageIndex],
    );
  }
}
