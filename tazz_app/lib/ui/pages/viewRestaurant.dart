import 'package:flutter/material.dart';
import 'package:tazz_app/domain/restaurant.dart';
import 'package:tazz_app/domain/product.dart';

class ViewRestaurantPage extends StatelessWidget {
  final Restaurant restaurant;

  const ViewRestaurantPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category: ${restaurant.category.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            const Text(
              'Products:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: restaurant.products.length,
                itemBuilder: (context, index) {
                  final Product product = restaurant.products[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            // Add product to cart
                            CartItem.addToCart(product, restaurant);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${product.name} added to cart')),
                            );
                          },
                        ),
                      ],
                    ),
                    trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final Product product;
  final Restaurant restaurant;
  int quantity;

  CartItem({required this.product, required this.restaurant, this.quantity = 1});

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
