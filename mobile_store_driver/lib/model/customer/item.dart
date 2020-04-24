import 'dart:math';

import 'package:mobile_store_driver/model/driver/store_item.dart';

class Item {
  Item(
      {this.itemName,
      this.quantity,
      this.pricePerUnit,
      this.remaining,
      this.icon =
          'https://api.flutter.dev/flutter/static-assets/favicon.png'}) {
    this.totalPrice = this.pricePerUnit * this.quantity;
  }

  String itemName;
  int quantity;
  double pricePerUnit;
  double totalPrice;
  String icon;
  int remaining;

  static List<Item> createDummyItems() {
    List<Item> list = [];
    int itemsCount = new Random().nextInt(ITEMS.length);
    for (int i = 0; i < itemsCount; i++) {
      Item storeItem = Item(
          itemName: ITEMS[i],
          quantity: new Random().nextInt(20),
          pricePerUnit: new Random().nextInt(100).toDouble(),
          icon: 'https://api.flutter.dev/flutter/static-assets/favicon.png');
      list.add(storeItem);
    }
    return list;
  }
}
