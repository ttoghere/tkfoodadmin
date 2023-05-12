import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tkfoodadmin/models/opening_hours_model.dart';
import 'package:tkfoodadmin/models/product_model.dart';
import 'package:tkfoodadmin/models/restaurant_model.dart';
import 'package:tkfoodadmin/repositories/restaurant/base_restaurant_repository.dart';

class RestaurantRepository extends BaseRestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;
  RestaurantRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addRestaurant(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection("restaurants")
        .add(restaurant.toDocument());
  }

  @override
  Future<void> editProducts(List<Product> products, String restaurantId) async {
    await _firebaseFirestore.collection("restaurants").doc(restaurantId).update(
        {"products": products.map((product) => product.toDocument()).toList()});
  }

  @override
  Future<void> editRestaurantOpeningHours(
      List<OpeningHours> openingHours, String restaurantId) async {
    await _firebaseFirestore
        .collection("restaurants")
        .doc(restaurantId)
        .update({
      "openingHours":
          openingHours.map((openingHours) => openingHours.toDocument()).toList()
    });
  }

  @override
  Future<void> editRestaurantSettings(
      Restaurant restaurant, String restaurantId) async {
    await _firebaseFirestore
        .collection("restaurants")
        .doc(restaurantId)
        .update(restaurant.toDocument());
  }

  @override
  Stream<Restaurant> getRestaurant(String restaurantId) {
    return _firebaseFirestore
        .collection("restaurants")
        .doc(restaurantId)
        .snapshots()
        .map((event) => Restaurant.fromSnapshot(event));
  }
}
