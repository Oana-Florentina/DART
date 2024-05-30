import 'package:flutter/material.dart';
import 'package:tazz_app/domain/restaurant.dart';
import 'package:tazz_app/ui/pages/viewRestaurant.dart';

class RestaurantsByCategoryPage extends StatelessWidget {
  final List<Restaurant> restaurants;
  final String category;
  final List<String> miniThumbnailUrls;

  const RestaurantsByCategoryPage({
    Key? key,
    required this.restaurants,
    required this.category,
    required this.miniThumbnailUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: miniThumbnailUrls[index] != null
                ? Image.network(miniThumbnailUrls[index], width: 50, height: 50, fit: BoxFit.cover)
                : null,
            title: Text(restaurants[index].name),
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
