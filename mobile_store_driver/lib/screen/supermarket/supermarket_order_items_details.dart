import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_store_driver/model/cart_item.dart';
import 'package:mobile_store_driver/model/data_sample.dart';
import 'package:mobile_store_driver/screen/supermarket/submit_supermarket_order.dart';

import '../../constants.dart';
import '../../model/driver/refill_order.dart';

class StoreKeeper extends StatefulWidget {
  @override
  _StoreKeeperState createState() => _StoreKeeperState();
}

class _StoreKeeperState extends State<StoreKeeper> {
  RefillOrder refillOrder;
  double totalValue = 0;
  int totalItems = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.refillOrder = ModalRoute.of(context).settings.arguments as RefillOrder;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'Store Items Request',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Constants.SUPERMARKET_APP_COLOR,
          centerTitle: true,
        ),
        body: ListView(children: getCartItems()));
  }

  List<Widget> getCartItems() {
    List<Widget> widgets = [];

    // Header Widget
    widgets.add(getHeaderWidget());

    // Cart Items
    DataSample.storeKeeper
        .forEach((item) => widgets.add(getItemCard(cartItem: item)));

    // Total Widget
    widgets.add(getTotalWidget());

    return widgets;
  }

  Widget getTotalWidget() {
    return Card(
      color: Colors.white,
      elevation: 1.0,
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
                    style: TextStyle(fontSize: 20),
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
                    style: TextStyle(fontSize: 20),
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
                    style: TextStyle(fontSize: 20),
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
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    totalItems.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            getAcceptButton(),
          ],
        ),
      ),
    );
  }

  Widget getAcceptButton() {
    if (this.refillOrder.status == Constants.STATUS_IN_PROGRESS) {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: RaisedButton.icon(
              onPressed: () {
                RefillOrder.approveOrder(this.refillOrder);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SubmitStoreScreen()));
              },
              color: Color(0xffb80d57),
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              label: Text(
                'Accept Store Request',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        ],
      );
    }
    return new Container();
  }

  Widget getHeaderWidget() {
    return Card(
        color: Color(0xfff8615a),
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Items',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }

  addToCart({CartItemModel cartItem}) {
    totalValue = totalValue + cartItem.product.price;
    totalItems++;
    cartItem.quantity++;
  }

  removeFromCart({CartItemModel cartItem}) {
    totalValue = totalValue - cartItem.product.price;
    totalItems--;
    cartItem.quantity--;
  }

  deleteCartItem(CartItemModel cartItem) {
    totalValue = totalValue - (cartItem.product.price * cartItem.quantity);
    totalItems = totalItems - cartItem.quantity;
    cartItem.quantity = 0;
    DataSample.storeKeeper.remove(cartItem);
  }

  Widget getItemCard({CartItemModel cartItem}) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: CircleAvatar(
              backgroundImage: AssetImage(cartItem.product.image),
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
                  cartItem.product.name,
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
    );
  }
}
