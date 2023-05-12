import 'package:tkfoodadmin/models/models.dart';

abstract class BaseRestaurantRepository {
  Future<void> addRestaurant(Restaurant restaurant);
  Future<void> editRestaurantSettings(
      Restaurant restaurant, String restaurantId);
  Future<void> editRestaurantOpeningHours(
      List<OpeningHours> openingHours, String restaurantId);
  Future<void> editProducts(List<Product> products, String restaurantId);
  Stream<Restaurant> getRestaurant(String restaurantId);
}
