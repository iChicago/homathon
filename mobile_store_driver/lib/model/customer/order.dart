import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/model/customer/item.dart';
import 'package:mobile_store_driver/model/data_sample.dart';

class Order {
  static final double VAT = 0.05;
  static final List<Order> _list = [];

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
  double vatTotal;
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

  static List<Order> get list => _list;

  static Order createOrder() {
    Order customerOrder = Order(
        orderId: new Random().nextInt(100),
        status: Constants.STATUS_NEW,
        distance: 2.5,
        deliveryFees: 10,
        address: ' 1234, King Fahd rd, Olaya ');
    customerOrder.latLng = LatLng(24.714007, 46.672164);
    double itemTotal = 0;
    DataSample.cartItems.forEach((cartItem) {
      Item storeItem = Item(
          itemName: cartItem.product.name,
          quantity: cartItem.quantity,
          pricePerUnit: cartItem.product.price.toDouble(),
          image: AssetImage(cartItem.product.image));
      itemTotal += storeItem.pricePerUnit * cartItem.quantity;
      cartItem.product.remaining -= cartItem.quantity;
      customerOrder.items.add(storeItem);
    });
    customerOrder.itemsTotal = itemTotal;
    customerOrder.vatTotal = customerOrder.itemsTotal * VAT;
    customerOrder.orderTotal =
        itemTotal + customerOrder.vatTotal + customerOrder.deliveryFees;
    _list.add(customerOrder);
    return customerOrder;
  }
}
