import 'dart:math';

import 'package:flutter/cupertino.dart';

const ITEMS = [
  'Carrot',
  'Milk',
  'Bread',
  'Coffee',
  'Tea',
  'Water',
  'Banana',
  'Tomato',
  'Onion',
  'Botato',
  'Orange',
  'Apple',
  'Onion',
  'yoghurt',
];

class StoreItem {
  StoreItem({this.itemName, this.storeQuantity, this.icon});

  String itemName;
  int storeQuantity;
  AssetImage icon;

  static List<StoreItem> createDummyStoreItems() {
    List<StoreItem> list = [];
    int itemsCount = new Random().nextInt(ITEMS.length);
    for (int i = 0; i < itemsCount; i++) {
      StoreItem storeItem = StoreItem(
          itemName: ITEMS[i],
          storeQuantity: new Random().nextInt(20),
          icon: null);
      list.add(storeItem);
    }
    return list;
  }
}
