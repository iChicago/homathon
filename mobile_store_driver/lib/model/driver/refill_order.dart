import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/model/cart_item.dart';
import 'package:mobile_store_driver/model/driver/store_item.dart';
import 'package:mobile_store_driver/model/driver/supplier.dart';
import 'package:mobile_store_driver/screen/driver-orders/DriverApp_CreateStoreRequest.dart';

class RefillOrder {
  static final List<RefillOrder> driverRefillOrders = [];
  static RefillOrder todayStoreOrder;

  static createTodayStoreOrder(List<CartItem> cartItems, int totalItems) {
    todayStoreOrder = RefillOrder(
      orderId: Random().nextInt(100),
      status: Random().nextBool()
          ? Constants.STATUS_APPROVED
          : Constants.STATUS_IN_PROGRESS,
      isStore: true,
    );
    cartItems.forEach((cartItem) {
      StoreItem storeItem = StoreItem(
          itemName: cartItem.name,
          storeQuantity: cartItem.quantity,
          image: cartItem.image);
      todayStoreOrder.storeItems.add(storeItem);
    });
    todayStoreOrder.itemsTotal = totalItems;
    todayStoreOrder.status = Constants.STATUS_IN_PROGRESS;
  }

  static createRefillOrder(List<CartItemModel> cartItems, int totalItems) {
    RefillOrder refillOrder = RefillOrder(
      orderId: Random().nextInt(100),
      status: Random().nextBool()
          ? Constants.STATUS_APPROVED
          : Constants.STATUS_IN_PROGRESS,
      isStore: false,
    );
    cartItems.forEach((cartItem) {
      StoreItem storeItem = StoreItem(
          itemName: cartItem.product.name,
          storeQuantity: cartItem.quantity,
          image: AssetImage(cartItem.product.image));
      refillOrder.storeItems.add(storeItem);
    });
    refillOrder.itemsTotal = totalItems;
    refillOrder.status = Constants.STATUS_IN_PROGRESS;
    driverRefillOrders.add(refillOrder);
  }

  RefillOrder(
      {this.orderId,
      this.status,
      this.itemsTotal,
      this.supplier,
      this.supplierRemarks,
      this.availabilityTime,
      this.isStore = false});

  int orderId;
  double distance;
  String status;
  int itemsTotal;
  Supplier supplier;
  String supplierRemarks;
  DateTime availabilityTime;
  bool isStore;
  List<StoreItem> storeItems = [];

  addDummyStoreItems(List<StoreItem> storeItems) {
    if (storeItems != null && storeItems.isNotEmpty) {
      this.storeItems.addAll(storeItems);
    }
  }

  static getRefillOrders(numberOfOrders, {bool isStore = false}) {
    if (driverRefillOrders.isEmpty) {
      for (int i = 0; i < numberOfOrders; i++) {
        driverRefillOrders.add(createDummyRefillOrder(isStore));
      }
    }
    return driverRefillOrders;
  }

  static RefillOrder createDummyRefillOrder(bool isStore) {
    RefillOrder randomOrder = RefillOrder(
      orderId: Random().nextInt(100),
      status: Random().nextBool()
          ? Constants.STATUS_APPROVED
          : Constants.STATUS_IN_PROGRESS,
      isStore: isStore,
    );
    randomOrder.addDummyStoreItems(StoreItem.createDummyStoreItems());
    randomOrder.itemsTotal = randomOrder.storeItems.length;
    if (Constants.STATUS_APPROVED == randomOrder.status) {
      randomOrder.supplier = Supplier.createDummySupplier(isStore: isStore);
      randomOrder.availabilityTime = DateTime.now();
      randomOrder.supplierRemarks =
          isStore ? 'We are open until 9 PM' : 'Conside calling before arrival';
    }
    return randomOrder;
  }

  static void approveOrder(RefillOrder refillOrder) {
    refillOrder.supplier =
        Supplier.createDummySupplier(isStore: refillOrder.isStore);
    refillOrder.availabilityTime = DateTime.now();
    refillOrder.supplierRemarks = refillOrder.isStore
        ? 'We are open until 9 PM'
        : 'Conside calling before arrival';
    refillOrder.status = Constants.STATUS_APPROVED;
  }
}
