import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_store_driver/model/driver/refill_order.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver_orders.screen.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<CartItem> cartItems;
  double totalValue = 0;
  int totalItems = 0;

  @override
  void initState() {
    super.initState();

    cartItems = [
      CartItem(
          name: 'Milk',
          price: 4,
          quantity: 5,
          image: AssetImage('assets/images/milk.jpg')),
      CartItem(
          name: 'Saudia Ice Cream',
          price: 7,
          quantity: 6,
          image: AssetImage('assets/images/icecream.jpg')),
      CartItem(
          name: 'Lays',
          price: 1,
          quantity: 15,
          image: AssetImage('assets/images/lays.jpg')),
      CartItem(
          name: 'Onion',
          price: 3,
          quantity: 15,
          image: AssetImage('assets/images/onion.jpg')),
    ];

    // Total items and value
    for (int i = 0; i < cartItems.length; i++) {
      totalValue = totalValue + (cartItems[i].price * cartItems[i].quantity);
      totalItems = totalItems + cartItems[i].quantity;
    }

    cartItems.forEach(
        (item) => {totalValue = totalValue + (item.price * item.quantity)});
  }

  List<Widget> getCartItems() {
    List<Widget> widgets = [];

    // Header Widget
    widgets.add(getHeaderWidget());

    // Cart Items
    cartItems.forEach((item) => {widgets.add(getItemCard(cartItem: item))});

    // Total Widget
    widgets.add(getTotalWidget());

    return widgets;
  }

  Widget getTotalWidget() {
    return Card(
        elevation: 1.0,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total',
                style: TextStyle(
                  color: Color(0xfff8615a),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Refrigerator Items',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '5',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Freezer Items',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '6',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Room Temperature Items',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '30',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Total Items',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffb80d57)),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      totalItems.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffb80d57),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: RaisedButton.icon(
                      onPressed: () {
                        RefillOrder.createTodayStoreOrder(
                            cartItems, totalItems);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DriverOrdersPage()));
                      },
                      color: Color(0xfff8615a),
                      icon: Icon(
                        Icons.cloud_upload,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Publish Store Request',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget getHeaderWidget() {
    return Card(
        color: Color(0xffb80d57),
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(50.0, 8.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Items',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }

  addToCart({CartItem cartItem}) {
    totalValue = totalValue + cartItem.price;
    totalItems++;
    cartItem.quantity++;
  }

  removeFromCart({CartItem cartItem}) {
    totalValue = totalValue - cartItem.price;
    totalItems--;
    cartItem.quantity--;
  }

  deleteCartItem(CartItem cartItem) {
    totalValue = totalValue - (cartItem.price * cartItem.quantity);
    totalItems = totalItems - cartItem.quantity;
    cartItem.quantity = 0;
    cartItems.remove(cartItem);
  }

  Widget getItemCard({CartItem cartItem}) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: CircleAvatar(
                backgroundImage: cartItem.image,
                radius: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cartItem.name,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ), //
            Expanded(
              flex: 2,
              child: Text(
                cartItem.quantity.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Request To Store Items',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xffffd868),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: getCartItems()));
  }
}

class CartItem {
  CartItem({this.name, this.price, this.quantity, this.image});

  String name;
  double price;
  int quantity;
  AssetImage image;
}
