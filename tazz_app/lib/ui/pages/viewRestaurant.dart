import 'package:flutter/material.dart';
import 'package:tazz_app/domain/restaurant.dart';
import 'package:tazz_app/domain/product.dart';
import 'package:tazz_app/domain/category.dart';

class ViewRestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  const ViewRestaurantPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  _ViewRestaurantPageState createState() => _ViewRestaurantPageState();
}

class _ViewRestaurantPageState extends State<ViewRestaurantPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  List<Product> filterProducts(FoodCategory category) {
    if (category == 'All') {
      return widget.restaurant.products;
    } else {
      return widget.restaurant.products
          .where((product) => product.category == category)
          .toList();
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.restaurant.name),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            widget.restaurant.thumbnail, // Display the restaurant's image
            height: 300, // Adjust height as needed
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.restaurant.category.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  '${widget.restaurant.details}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Coffee'),
                    Tab(text: 'Drinks'),
                    Tab(text: 'Food'),
                    Tab(text: 'Sweets'),
                  ],
                ),
                SizedBox(height: 16),
                const Text(
                  'Products:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
                  height: MediaQuery.of(context).size.height -
                      500, // Adjust the height as needed
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      buildProductList(widget.restaurant.products),
                      buildProductList(filterProducts(FoodCategory.Coffee)),
                      buildProductList(filterProducts(FoodCategory.Drinks)),
                      buildProductList(filterProducts(FoodCategory.Food)),
                      buildProductList(filterProducts(FoodCategory.Sweets)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
Widget buildProductList(List<Product> products) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final Product product = products[index];
      return Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  // Add product to cart
                  CartItem.addToCart(product, widget.restaurant);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} added to cart')),
                  );
                },
              ),
            ],
          ),
         
          trailing: Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    },
  );
}
    }


class CartItem {
  final Product product;
  final Restaurant restaurant;
  int quantity;

  CartItem(
      {required this.product, required this.restaurant, this.quantity = 1});

  static List<CartItem> cartItems = [];

  static void addToCart(Product product, Restaurant restaurant) {
    bool found = false;
    for (CartItem item in cartItems) {
      if (item.product == product && item.restaurant == restaurant) {
        item.quantity++;
        found = true;
        break;
      }
    }
    if (!found) {
      cartItems.add(CartItem(product: product, restaurant: restaurant));
    }
  }

  static void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  static void clearCart() {
    cartItems.clear();
  }

  static List<CartItem> getCartItems() {
    return cartItems;
  }
}
