import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tkfoodadmin/main.dart';
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
  Future<void> editProducts(List<Product> products) async {
    await _firebaseFirestore.collection("restaurants").doc(restaurantID).update(
        {"products": products.map((product) => product.toDocument()).toList()});
  }

  @override
  Future<void> editRestaurantOpeningHours(
      List<OpeningHours> openingHours) async {
    await _firebaseFirestore
        .collection("restaurants")
        .doc(restaurantID)
        .update({
      "openingHours":
          openingHours.map((openingHours) => openingHours.toDocument()).toList()
    });
  }

  @override
  Future<void> editRestaurantSettings(
    Restaurant restaurant,
  ) async {
    await _firebaseFirestore
        .collection("restaurants")
        .doc(restaurantID)
        .update(restaurant.toDocument());
  }

  @override
  Stream<Restaurant> getRestaurant() {
    return _firebaseFirestore
        .collection("restaurants")
        .doc(restaurantID)
        .snapshots()
        .map((event) => Restaurant.fromSnapshot(event));
  }
}
