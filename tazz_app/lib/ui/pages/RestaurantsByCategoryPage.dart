import 'package:flutter/material.dart';
import 'package:tazz_app/domain/restaurant.dart';
import 'package:tazz_app/ui/pages/viewRestaurant.dart';

class RestaurantsByCategoryPage extends StatelessWidget {
  final List<Restaurant> restaurants;
  final String category;

  const RestaurantsByCategoryPage({Key? key, required this.restaurants, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants Offering $category'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(restaurants[index].name),
            subtitle: Text(restaurants[index].category.name),
            onTap: () {
              // Navigate to the restaurant details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewRestaurantPage(restaurant: restaurants[index]),
                ),
              );
            },

          );
        },
      ),
    );
  }
}
