import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_store_driver/constants.dart';

class Order {
  Order({this.orderId, this.status, this.distance, this.total, this.latLng});
  int orderId;
  double distance;
  String status;
  double total;
  List<Item> items = [];
  addItem(Item item) {
    if (item != null) {
      this.items.add(item);
    }
  }

  LatLng latLng;
}

class Item {
  Item({this.itemName, this.quantity, this.totalPrice});
  String itemName;
  int quantity;
  double totalPrice;
}

class Orders {
  List<Order> list = [];
  getOrders() {
    Item item1 = Item(itemName: 'Item 1', quantity: 2, totalPrice: 3);
    Item item2 = Item(itemName: 'Item 2', quantity: 3, totalPrice: 30);
    Item item3 = Item(itemName: 'Item 3', quantity: 5, totalPrice: 77);
    Item item4 = Item(itemName: 'Item 4', quantity: 10, totalPrice: 150);
    Item item5 = Item(itemName: 'Item 5', quantity: 4, totalPrice: 89);

    Order first = Order(
        orderId: 1,
        status: Constants.newOrders,
        distance: 1,
        total: 55.5,
        latLng: LatLng(24.712820, 46.672467));
    first..addItem(item1)..addItem(item2)..addItem(item5);

    Order second = Order(
        orderId: 2,
        status: Constants.inProgressOrders,
        distance: 0,
        total: 55.5,
        latLng: LatLng(24.7565531, 46.6394167));
    second..addItem(item1)..addItem(item3)..addItem(item4);

    Order third = Order(
        orderId: 3,
        status: Constants.deliveredOrders,
        distance: 1.3,
        total: 55.5,
        latLng: LatLng(24.712820, 46.672467));
    third..addItem(item4)..addItem(item3);

    Order forth = Order(
        orderId: 4,
        status: Constants.cancelledOrders,
        distance: 0.4,
        total: 55.5,
        latLng: LatLng(24.712820, 46.672467));
    forth..addItem(item2)..addItem(item4);

    Order fifth = Order(
        orderId: 5,
        status: Constants.inProgressOrders,
        distance: 1,
        total: 55.5,
        latLng: LatLng(24.712820, 46.672467));
    fifth.addItem(item5);

    list..add(first)..add(second)..add(third)..add(forth)..add(fifth);
    return list;
  }
}
