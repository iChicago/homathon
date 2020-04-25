import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_store_driver/model/cart_model.dart';
import 'package:mobile_store_driver/model/data_sample.dart';
import 'package:mobile_store_driver/screen/driver-orders/submit_driver_screen.dart';

import '../../constants.dart';
import '../../model/driver/refill_order.dart';

class RefillPage extends StatefulWidget {
  static const String ROUTE_NAME = '/refill';

  @override
  _RefillDriverScreenState createState() => _RefillDriverScreenState();
}

class _RefillDriverScreenState extends State<RefillPage> {
  double cartTotal = 0;
  double totalValue = 0;
  int totalItems = 0;

  @override
  void initState() {
    super.initState();

    // Total items and value
    for (int i = 0; i < DataSample.refilItems.length; i++) {
      totalValue = totalValue +
          (DataSample.refilItems[i].product.price *
              DataSample.refilItems[i].quantity);
      totalItems = totalItems + DataSample.refilItems[i].quantity;
    }
  }

  List<Widget> getCartItems() {
    List<Widget> widgets = [];

    // Cart Items
    DataSample.refilItems
        .forEach((item) => widgets.add(getItemCard(refilItem: item)));
    widgets.add(getCartTotalWidget());
    return widgets;
  }

  Widget getCartTotalWidget() {
    return Card(
        elevation: 1.0,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 2.0, 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff721b65)),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Total Items',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'SR $totalItems',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xfff8615a),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Total Value',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffb80d57)),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'SR $totalValue',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffb80d57),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: RaisedButton.icon(
                      onPressed: () {
                        RefillOrder createdRefillOrder =
                            RefillOrder.createRefillOrder(
                                DataSample.refilItems, totalItems);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SubmitDriverScreen(
                                      order: createdRefillOrder,
                                    )));
                      },
                      color: Color(0xffb80d57),
                      icon: Icon(
                        Icons.cloud_upload,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Publish Order',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  addToCart({CartItemModel refilItrm}) {
    totalValue = totalValue + refilItrm.product.price;
    totalItems++;
    refilItrm.quantity++;
  }

  removeFromCart({CartItemModel refilItrm}) {
    totalValue = totalValue - refilItrm.product.price;
    totalItems--;
    refilItrm.quantity--;
  }

  deleteCartItem(CartItemModel refilItrm) {
    totalValue = totalValue - (refilItrm.product.price * refilItrm.quantity);
    totalItems = totalItems - refilItrm.quantity;
    refilItrm.quantity = 0;
    DataSample.refilItems.remove(refilItrm);
  }

  Widget getItemCard({CartItemModel refilItem}) {
    return Dismissible(
      key: GlobalKey<FormBuilderState>(),
      background: Container(
        alignment: Alignment.centerLeft,
        color: Color(0xffb80d57),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        setState(() {
          deleteCartItem(refilItem);
        });
      },
      child: Card(
        elevation: 1.0,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(refilItem.product.image),
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
                      refilItem.product.name,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'SR ${refilItem.product.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff8615a),
                          fontSize: 15,
                          letterSpacing: 2,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: MaterialButton(
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      if (refilItem.quantity == 1) {
                        deleteCartItem(refilItem);
                      }
                      removeFromCart(refilItrm: refilItem);
                    });
                  },
                  color: Colors.grey[200],
                  child: Icon(
                      refilItem.quantity > 1 ? Icons.remove : Icons.delete,
                      size: 25,
                      color: Colors.grey),
                  shape: CircleBorder(),
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  refilItem.quantity.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: MaterialButton(
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      refilItem.quantity++;
                      addToCart(refilItrm: refilItem);
                    });
                  },
                  color: Color(0xffb80d57),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRemoveButton({CartItemModel refilItem}) {
    return Expanded(
      flex: 4,
      child: MaterialButton(
        minWidth: 60,
        onPressed: () {
          setState(() {
            deleteCartItem(refilItem);
          });
        },
        color: Colors.grey[200],
        child: Icon(Icons.delete, size: 25, color: Colors.grey),
        shape: CircleBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Refill Order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Constants.DRIVER_APP_COLOR,
        centerTitle: true,
      ),
      body: ListView(children: getCartItems()),
    );
  }
}
