import 'package:flutter/cupertino.dart';

class Item {
  Item(
      {this.itemName,
      this.quantity,
      this.pricePerUnit,
      this.image}) {
    this.totalPrice = this.pricePerUnit * this.quantity;
  }

  String itemName;
  int quantity;
  double pricePerUnit;
  double totalPrice;
  AssetImage image;
}
