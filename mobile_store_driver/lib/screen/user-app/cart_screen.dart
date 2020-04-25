import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_store_driver/Model/model_index.dart';
import 'package:mobile_store_driver/core/index.dart';
import 'package:mobile_store_driver/model/customer/order.dart';
import 'package:mobile_store_driver/screen/user-app/index.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double cartTotal = 0;
  double deliveryFees = 10;
  double vatPresent = 0.05;
  double vat = 0;
  double orderTotal = 0;

  @override
  void initState() {
    super.initState();
    // Cart Total
    DataSample.cartItems.forEach(
        (item) => cartTotal = cartTotal + (item.product.price * item.quantity));
    vat = (cartTotal + deliveryFees) * vatPresent;
    orderTotal = cartTotal + deliveryFees + vat;
  }

  List<Widget> getCartItems() {
    List<Widget> widgets = [];

    // Cart Items
    DataSample.cartItems
        .forEach((item) => widgets.add(getItemCard(cartItem: item)));
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
                      'Cart Total',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'SR ${cartTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Delivery Fees',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'SR $deliveryFees',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xfff8615a),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Vat %5',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'SR $vat',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
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
                      'Order Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffb80d57)),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'SR $orderTotal',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PaymentScreen()));
                      },
                      color: Color(0xffb80d57),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Checkout',
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

  addToCart(int itemPrice) {
    cartTotal = (cartTotal + itemPrice);
    orderTotal = orderTotal + itemPrice;
    vat = vat + (itemPrice * vatPresent);
  }

  removeFromCart(int itemPrice) {
    cartTotal = cartTotal - itemPrice;
    orderTotal = orderTotal - itemPrice;
    vat = vat - (itemPrice * vatPresent);
  }

  void removeCartItem(CartItemModel cartItem) {
    cartTotal = cartTotal - (cartItem.product.price * cartItem.quantity);
    orderTotal = orderTotal -
        ((cartItem.product.price * cartItem.quantity) +
            ((cartItem.product.price * cartItem.quantity) * vatPresent));
    vat = vat - ((cartItem.product.price * cartItem.quantity) * vatPresent);
    DataSample.cartItems.remove(cartItem);
  }

  Widget getItemCard({CartItemModel cartItem}) {
    return Dismissible(
      key: GlobalKey<FormBuilderState>(),
      background: Container(
        alignment: Alignment.centerLeft,
        color: Color(0xffb80d57),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        removeCartItem(cartItem);
        setState(() {});
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
                    Text(
                      'SR ${cartItem.product.price}',
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
                      cartItem.quantity--;
                      if (cartItem.quantity == 0) {
                        removeCartItem(cartItem);
                      }
                      removeFromCart(cartItem.product.price);
                    });
                  },
                  color: Colors.grey[200],
                  child: Icon(
                      cartItem.quantity > 1 ? Icons.remove : Icons.delete,
                      size: 25,
                      color: Colors.grey),
                  shape: CircleBorder(),
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  cartItem.quantity.toString(),
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
                      cartItem.quantity++;
                      addToCart(cartItem.product.price);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff721b65),
        centerTitle: true,
      ),
      body: ListView(children: getCartItems()),
    );
  }
}
