import 'package:flutter/material.dart';
import 'package:mobile_store_driver/model/cart_model.dart';
import 'package:mobile_store_driver/model/data_sample.dart';
import 'package:mobile_store_driver/model/product.dart';
import 'package:mobile_store_driver/screen/user-app/index.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  ProductDetailsScreen({@required this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.product.name,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff721b65),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                  height: 150.0,
                  width: 30.0,
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CartScreen()));
                    },
                    child: new Stack(
                      children: <Widget>[
                        new IconButton(
                          icon: new Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        ),
                        DataSample.cartItems.length == null ||
                                DataSample.cartItems.length == 0
                            ? new Container()
                            : new Positioned(
                                child: new Stack(
                                children: <Widget>[
                                  new Icon(Icons.brightness_1,
                                      size: 20.0, color: Color(0xffffd868)),
                                  new Positioned(
                                      top: 3.0,
                                      right: 5.0,
                                      child: new Center(
                                        child: new Text(
                                          "${DataSample.cartItems.length}",
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(
                                              color: Color(0xff721b65),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                ],
                              )),
                      ],
                    ),
                  )),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            elevation: 1.0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      widget.product.image,
                      width: 140,
                      height: 140,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(widget.product.name,
                              style: TextStyle(
                                  color: Color(0xff721b65), fontSize: 20)),
                          Text("${widget.product.price} SR",
                              style: TextStyle(
                                  color: Color(0xffb80d57), fontSize: 18)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product.moreInfo,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    addButton(product: widget.product),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void addProductInCart({Product product}) {
    bool flag = false;
    int index = 0;
    if (DataSample.cartItems.length == 0) {
      DataSample.cartItems.add(CartItemModel(product: product, quantity: 1));
    } else {
      for (var i = 0; i < DataSample.cartItems.length; i++) {
        if (DataSample.cartItems[i].product.code == product.code) {
          flag = true;
          index = i;
        }
      }
      if (flag) {
        DataSample.cartItems[index].quantity += 1;
      } else {
        DataSample.cartItems.add(CartItemModel(product: product, quantity: 1));
      }
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    for (var i = 0; i < DataSample.cartItems.length; i++) {
      if (DataSample.cartItems[i].product.code == cartItem.product.code) {
        DataSample.cartItems[i].quantity--;
      }
    }
  }

  void incressCartItem(CartItemModel cartItem) {
    for (var i = 0; i < DataSample.cartItems.length; i++) {
      if (DataSample.cartItems[i].product.code == cartItem.product.code) {
        DataSample.cartItems[i].quantity++;
      }
    }
  }

  void removeFromCart(CartItemModel cartItem) {
    DataSample.cartItems.remove(cartItem);
  }

  Widget addButton({Product product}) {
    bool flag = false;
    CartItemModel cartItemModel;
    for (var i = 0; i < DataSample.cartItems.length; i++) {
      if (DataSample.cartItems[i].product.code == product.code) {
        flag = true;
        cartItemModel = DataSample.cartItems[i];
      }
    }
    if (flag) {
      return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: MaterialButton(
                minWidth: 60,
                onPressed: () {
                  setState(() {
                    if (cartItemModel.quantity == 1) {
                      removeFromCart(cartItemModel);
                    }
                    removeCartItem(cartItemModel);
                  });
                },
                color: Colors.grey[200],
                child: Icon(
                    cartItemModel.quantity > 1 ? Icons.remove : Icons.delete,
                    size: 25,
                    color: Colors.grey),
                shape: CircleBorder(),
              ),
            ),
            Expanded(
              flex: 0,
              child: Text(
                "${cartItemModel.quantity}",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 3,
              child: MaterialButton(
                minWidth: 60,
                onPressed: () {
                  setState(() {
                    incressCartItem(cartItemModel);
                  });
                },
                color: Color(0xff721b65),
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
      );
    } else {
      return Builder(
        builder: (context) => Center(
          child: RaisedButton(
            elevation: 0.0,
            color: Color(0xff721b65),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xffffd868),
                  content: Text(
                    'Item has been added to the cart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "DinNext",
                        color: Color(0xff721b65)),
                  ),
                ),
              );
              addProductInCart(product: widget.product);
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text("Add to cart",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ),
      );
    }
  }
}
