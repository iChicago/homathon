import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/model/customer/item.dart';

class Order {
  static final List<Order> list = [];

  Order(
      {this.orderId,
      this.status,
      this.distance,
      this.itemsTotal,
      this.deliveryFees,
      this.orderTotal,
      this.address,
      this.latLng,
      this.cancellationReason});

  int orderId;
  double distance;
  String status;
  double itemsTotal;
  double deliveryFees;
  double orderTotal;
  String address;
  double longitude;
  LatLng latLng;
  String cancellationReason;
  List<Item> items = [];

  addItem(Item item) {
    if (item != null) {
      this.items.add(item);
    }
  }

  static List<Order> getOrders(numberOfOrders) {
    if (list.isEmpty) {
      for (int i = 0; i < numberOfOrders; i++) {
        list.add(createDummyOrder());
      }
    }
    return list;
  }

  static Order createDummyOrder() {
    Order randomOrder = Order(
        orderId: new Random().nextInt(100),
        status: new Random().nextBool()
            ? Constants.STATUS_IN_PROGRESS
            : Constants.STATUS_DELIVERED,
        distance: new Random().nextInt(5).toDouble(),
        deliveryFees: new Random().nextInt(50).toDouble(),
        address: ' 1234, King Fahd rd, Olaya ');
    randomOrder.latLng = LatLng(46.672164, 24.714007);
    double itemTotal = 0;
    randomOrder.items = Item.createDummyItems();
    randomOrder.items.forEach((item) {
      itemTotal += item.totalPrice;
    });
    randomOrder.itemsTotal = itemTotal;
    randomOrder.orderTotal = itemTotal + randomOrder.deliveryFees;

    return randomOrder;
  }
}
