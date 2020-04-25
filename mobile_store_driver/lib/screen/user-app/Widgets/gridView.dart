import 'package:flutter/material.dart';
import 'package:mobile_store_driver/model/cart_model.dart';
import 'package:mobile_store_driver/model/data_sample.dart';
import 'package:mobile_store_driver/model/product.dart';
import 'package:mobile_store_driver/screen/user-app/index.dart';

class GridViewWidget extends StatefulWidget {
  final List<Product> products;
  var _gridViewWidgetState;

  GridViewWidget({@required this.products, @required notifyParent}) {
    _gridViewWidgetState = _GridViewWidgetState(notifyParent: notifyParent);
  }

  @override
  _GridViewWidgetState createState() => _gridViewWidgetState;
}

class _GridViewWidgetState extends State<GridViewWidget> {
  _GridViewWidgetState({this.notifyParent});

  // reference to notify method to be executed in parent when needed
  var notifyParent;

  @override
  Widget build(BuildContext context) {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: widget.products.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: cardOfProduct(product: widget.products[index]),
        );
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: (itemWidth / itemHeight),
      ),
    );
  }

  Widget cardOfProduct({Product product}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProductDetailsScreen(
                  product: product,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0XFFE5E5E5),
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                product.image,
                width: 140,
                height: 140,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(product.name,
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Text("${product.price} SR",
                      style: TextStyle(color: Colors.pink, fontSize: 14)),
                ],
              ),
              addButton(product: product),
            ],
          ),
        ),
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
    this.notifyParent();
  }

  void removeCartItem(CartItemModel cartItem) {
    for (var i = 0; i < DataSample.cartItems.length; i++) {
      if (DataSample.cartItems[i].product.code == cartItem.product.code) {
        DataSample.cartItems[i].quantity--;
      }
    }
    this.notifyParent();
  }

  void incressCartItem(CartItemModel cartItem) {
    for (var i = 0; i < DataSample.cartItems.length; i++) {
      if (DataSample.cartItems[i].product.code == cartItem.product.code) {
        DataSample.cartItems[i].quantity++;
      }
    }
    this.notifyParent();
  }

  void removeFromCart(CartItemModel cartItem) {
    DataSample.cartItems.remove(cartItem);
    this.notifyParent();
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
                    } else {
                      removeCartItem(cartItemModel);
                    }
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
              addProductInCart(product: product);
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

// class GridViewWidget extends StatelessWidget {
//   final List<Product> products;

//   GridViewWidget({@required this.products});
//   @override
//   Widget build(BuildContext context) {
//     final double itemHeight =
//         (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2;
//     final double itemWidth = MediaQuery.of(context).size.width / 2;
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: ScrollPhysics(),
//       scrollDirection: Axis.vertical,
//       itemCount: products.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: ProdectWidget(
//             product: products[index],
//           ),
//         );
//       },
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
//         mainAxisSpacing: 10.0,
//         crossAxisSpacing: 10.0,
//         childAspectRatio: (itemWidth / itemHeight),
//       ),
//     );
//   }
// }
