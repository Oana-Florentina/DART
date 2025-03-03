// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tazz_app/domain/restaurant.dart';
import 'package:tazz_app/domain/category.dart';
import 'package:tazz_app/domain/product.dart';
import 'package:tazz_app/ui/pages/viewRestaurant.dart';
import 'package:tazz_app/ui/pages/RestaurantsByCategoryPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String username = 'Florentina';
  List<List<CartItem>> receipts = [];

  final List<Restaurant> _restaurants = <Restaurant>[
    Restaurant(name: 'KFC', category: Category.FastFood, products: [
      Product(name: 'Chicken Wings', price: 5.99, category: FoodCategory.Food),
      Product(name: 'Chicken Sandwich', price: 4.99, category: FoodCategory.Food),
      Product(name: 'Fries', price: 2.99, category: FoodCategory.Food),
      Product(name: 'Water', price: 1.99, category: FoodCategory.Drinks),
      Product(name: 'Soda', price: 1.99, category: FoodCategory.Drinks),
      Product(name: 'ice cream', price: 1.99, category: FoodCategory.Sweets),
      Product(name: 'Cappuccino', price: 4.99, category: FoodCategory.Coffee),
    ], details: 'KFC is a fast food restaurant chain that specializes in fried chicken.', thumbnail: 'https://cdn.pixabay.com/photo/2020/03/16/19/43/chicken-4938114_1280.jpg'),
    Restaurant(name: 'Starbucks', category: Category.CoffeeShop, products: [
      Product(name: 'Latte', price: 3.99, category: FoodCategory.Coffee),
      Product(name: 'Cappuccino', price: 4.99, category: FoodCategory.Coffee),
      Product(name: 'Mocha', price: 5.99, category: FoodCategory.Coffee),
      Product(name: 'Donut', price: 1.99, category: FoodCategory.Sweets),
      Product(name: 'Muffin', price: 2.99, category: FoodCategory.Sweets),
      Product(name: 'Sandwich', price: 6.99, category: FoodCategory.Food),
      Product(name: 'Water', price: 1.99, category: FoodCategory.Drinks),
    ], details: 'Starbucks is a coffee shop chain that offers a variety of coffee drinks and snacks.', thumbnail: 'https://cdn.pixabay.com/photo/2015/04/02/04/12/starbucks-703314_1280.jpg'),
    Restaurant(name: 'Pizza Hut', category: Category.PizzaPlace, products: [
      Product(name: 'Pepperoni Pizza', price: 9.99, category: FoodCategory.Food),
      Product(name: 'Cheese Pizza', price: 8.99, category: FoodCategory.Food),
      Product(name: 'Veggie Pizza', price: 10.99, category: FoodCategory.Food),
      Product(name: 'Sandwich', price: 6.99, category: FoodCategory.Food),
      Product(name: 'Water', price: 1.99, category: FoodCategory.Drinks),
      Product(name: 'Cappuccino', price: 4.99, category: FoodCategory.Coffee),
    ], details: 'Pizza Hut is a pizza restaurant chain that offers a variety of pizzas and other food items.', thumbnail: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
    Restaurant(name: 'Chipotle', category: Category.MexicanFood, products: [
      Product(name: 'Burrito', price: 7.99, category: FoodCategory.Food),
      Product(name: 'Taco', price: 2.99, category: FoodCategory.Food),
      Product(name: 'Bowl', price: 8.99, category: FoodCategory.Food),
      Product(name: 'Cappuccino', price: 4.99, category: FoodCategory.Coffee),
      Product(name: 'Water', price: 1.99, category: FoodCategory.Drinks),
    ], details: 'Chipotle is a Mexican food restaurant chain that offers burritos, tacos, and bowls.', thumbnail: 'https://cdn.pixabay.com/photo/2022/05/23/20/47/burrito-7217208_1280.jpg'),
    Restaurant(name: 'McDonalds', category: Category.FastFood, products: [
      Product(name: 'Big Mac', price: 4.99, category: FoodCategory.Food),
      Product(name: 'McNuggets', price: 3.99, category: FoodCategory.Food),
      Product(name: 'Water', price: 1.99, category: FoodCategory.Drinks),
      Product(name: 'Fries', price: 2.99, category: FoodCategory.Food),
      Product(name: 'Cappuccino', price: 4.99, category: FoodCategory.Coffee),
    ], details: 'McDonalds is a fast food restaurant chain that offers burgers, fries, and other food items.', thumbnail: 'https://cdn.pixabay.com/photo/2017/08/12/18/59/snack-2635035_1280.jpg'),
    Restaurant(name: 'Dunkin Donuts', category: Category.CoffeeShop, products: [
      Product(name: 'Donut', price: 1.99, category: FoodCategory.Sweets),
      Product(name: 'Coffee', price: 2.99, category: FoodCategory.Coffee),
      Product(name: 'Muffin', price: 3.99, category: FoodCategory.Sweets),
      Product(name: 'Sandwich', price: 6.99, category: FoodCategory.Food),
      Product(name: 'Water', price: 1.99, category: FoodCategory.Drinks),
      Product(name: 'Cappuccino', price: 4.99, category: FoodCategory.Coffee),
    ], details: 'Dunkin Donuts is a coffee shop chain that offers a variety of coffee drinks and donuts.', thumbnail: 'https://cdn.pixabay.com/photo/2019/01/28/14/07/donut-3960489_1280.jpg'),
    Restaurant(name: 'Papa Johns', category: Category.PizzaPlace, products: [
      Product(name: 'Pepperoni Pizza', price: 9.99, category: FoodCategory.Food),
      Product(name: 'Cheese Pizza', price: 8.99, category: FoodCategory.Food),
      Product(name: 'Veggie Pizza', price: 10.99, category: FoodCategory.Food),
      Product(name: 'Water', price: 1.99, category: FoodCategory.Drinks),
      Product(name: 'Cappuccino', price: 4.99, category: FoodCategory.Coffee),
    ], details: 'Papa Johns is a pizza restaurant chain that offers a variety of pizzas and other food items.', thumbnail: 'https://cdn.pixabay.com/photo/2020/06/08/16/49/pizza-5275191_1280.jpg'),
  ];

  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = username;

    // Set initial favorites
  if (_restaurants.isNotEmpty) {
    _restaurants[0].isFavorite = true; // Set the first restaurant as favorite
  }
  if (_restaurants.length > 1) {
    _restaurants[1].isFavorite = true; // Set the second restaurant as favorite
  }
  

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
      return GestureDetector(
        onTap: () {
          // Navigate to the restaurant details page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ViewRestaurantPage(restaurant: _restaurants[selectedIndex]),
            ),
          );
        },
        child: Card(
          elevation: 4, // Add elevation for a shadow effect
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add margin for spacing
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Add rounded corners
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Add rounded corners to the image
              child: Image.network(
                selectedRestaurant.thumbnail, // Add the URL of the restaurant's image
                height: 50, // Adjust height as needed
                width: 50, // Adjust width as needed
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              selectedRestaurant.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              selectedRestaurant.category.name, // Display restaurant category as subtitle
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  _restaurants[selectedIndex].isFavorite = false;
                });
              },
            ),
          ),
        ),
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

void showProductDialog(CartItem cartItem) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text(cartItem.product.name),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Price: \$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (cartItem.quantity > 1) {
                          setState(() {
                            cartItem.quantity--;
                          });
                          updateCart();
                        }
                        else {
                          // Remove the item from the cart
                          CartItem.removeFromCart(cartItem);
                          Navigator.of(context).pop();
                          updateCart();
                        }

                      },
                    ),
                    Text('Quantity: ${cartItem.quantity}'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          cartItem.quantity++;
                        });
                        updateCart();
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}

void updateCart() {
  setState(() {
    // Trigger a state update for the cart
  });
}



Widget buildCart() {
  List<CartItem> cartItems = CartItem.getCartItems();
  double totalPrice = cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            final CartItem cartItem = cartItems[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                title: Text(
                  '${cartItem.product.name} (${cartItem.restaurant.name})',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Quantity: ${cartItem.quantity}'),
                trailing: Text(
                  '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () => showProductDialog(cartItem),
              ),
            );
          },
        ),
      ),
      Divider(height: 1, color: Colors.grey),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                if (cartItems.isNotEmpty) {
                  receipts.add(List.from(cartItems));
                  CartItem.clearCart();
                  updateCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Payment successful, cart cleared')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cart is empty')),
                  );
                }
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    ],
  );
}


Widget buildHistory() {
  return ListView.builder(
    itemCount: receipts.length,
    itemBuilder: (BuildContext context, int index) {
      List<CartItem> receipt = receipts[index];
      double totalPrice = receipt.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
      return Card(
        child: ExpansionTile(
          title: Text('Receipt ${index + 1}'),
          subtitle: Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
          children: receipt.map((cartItem) {
            return ListTile(
              title: Text('${cartItem.product.name} (${cartItem.restaurant.name})'), // Include restaurant name
              subtitle: Text('Quantity: ${cartItem.quantity}'),
              trailing: Text('Price: \$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
              // Here you could add more details or an image if desired
            );
          }).toList(),
        ),
      );
    },
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
        childAspectRatio: 0.75,
      ),
      itemCount: _restaurants.length,
      itemBuilder: (BuildContext context, int index) {
        bool isFavorite = _restaurants[index].isFavorite;

        return GestureDetector(
          onTap: () {
            // Navigate to the restaurant details page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ViewRestaurantPage(restaurant: _restaurants[index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_restaurants[index].thumbnail),
                fit: BoxFit.cover,
              ),
            ),
            child: Card(
              color: Colors.transparent, // Make card transparent
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _restaurants[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Category: ${_restaurants[index].category.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _restaurants[index].isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food & More',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Change color to blue
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FoodTypeCard(
              foodType: 'Coffee',
              onTap: () {
                navigateToRestaurantsByCategory(Category.CoffeeShop);
              },
            ),
            FoodTypeCard(
              foodType: 'Pizza',
              onTap: () {
                navigateToRestaurantsByCategory(Category.PizzaPlace);
              },
            ),
            FoodTypeCard(
              foodType: 'Burgers',
              onTap: () {
                navigateToRestaurantsByCategory(Category.FastFood);
              },
            ),
          ],
        ),
        SizedBox(height: 5), // Reduce spacing
        Text(
          'Today\'s Menu',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green, // Change color to green
          ),
        ),
        SizedBox(height: 8), // Reduce spacing
        Expanded(child: buildTodaysMenu()), // Utilize available space
        SizedBox(height: 5), // Reduce spacing
        Text(
          'Favorite Restaurants',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange, // Change color to orange
          ),
        ),
        SizedBox(height: 8), // Reduce spacing
        Expanded(child: buildFavoriteRestaurants()), // Utilize available space
        SizedBox(height: 5), // Reduce spacing
      ],
    ),
  );
}


Widget buildTodaysMenu() {
  List<Product> allMenuItems = [];
  List<Restaurant> allRestaurants = [..._restaurants]; // Copy all restaurants

  // Flatten all products into a single list
  for (var restaurant in allRestaurants) {
    allMenuItems.addAll(restaurant.products);
  }

  if (allMenuItems.isEmpty) {
    return Text('No menu items available');
  }

  List<Product> todaysMenuItems = [];
  List<Restaurant> todaysMenuRestaurants = [];
  for (int i = 0; i < 3; i++) {
    if (allMenuItems.isNotEmpty) {
      int randomIndex = Random().nextInt(allMenuItems.length);
      Product product = allMenuItems[randomIndex];
      todaysMenuItems.add(product);
      // Find the restaurant that contains this product
      Restaurant restaurant = allRestaurants.firstWhere((restaurant) => restaurant.products.contains(product));
      todaysMenuRestaurants.add(restaurant);
      // Remove the product from the list to avoid duplicates
      allMenuItems.remove(product);
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8),
      Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: todaysMenuItems.map((item) {
                final index = todaysMenuItems.indexOf(item);
                final Restaurant restaurant = todaysMenuRestaurants[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('${restaurant.name} - \$${item.price.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      SizedBox(height: 8),
      Center(
        child: ElevatedButton(
          onPressed: () {
            for (int i = 0; i < todaysMenuItems.length; i++) {
              CartItem.addToCart(todaysMenuItems[i], todaysMenuRestaurants[i]);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Today\'s menu added to cart')),
            );
          },
          child: Text('Add Today\'s Menu to Cart'),
        ),
      )
    ],
  );
}


void navigateToRestaurantsByCategory(Category category) {
  List<Restaurant> restaurants = _restaurants.where((restaurant) => restaurant.category == category).toList();
  List<String> miniThumbnailUrls = restaurants.map((restaurant) => restaurant.thumbnail).toList();
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RestaurantsByCategoryPage(
        restaurants: restaurants,
        category: category.name,
        miniThumbnailUrls: miniThumbnailUrls,
      ),
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


class FoodTypeCard extends StatelessWidget {
  final String foodType;
  final VoidCallback onTap;

  const FoodTypeCard({Key? key, required this.foodType, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            foodType,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}