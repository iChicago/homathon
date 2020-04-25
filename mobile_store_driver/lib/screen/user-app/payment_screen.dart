import 'package:flutter/material.dart';
import 'package:mobile_store_driver/model/customer/order.dart';
import 'package:mobile_store_driver/model/data_sample.dart';
import 'package:mobile_store_driver/screen/user-app/Widgets/index.dart';
import 'package:mobile_store_driver/screen/user-app/index.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Check Out',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff721b65),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              AddressWidget(),
              PaymentMethodWidget(),
              CouponsWidget(),
              RaisedButton(
                  onPressed: () {
                    Order createdOrder = Order.createOrder();
                    DataSample.cartItems.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SubmintScreen(
                                  order: createdOrder,
                                )));
                  },
                  color: Color(0xffb80d57),
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          Text(
                            "check out",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

// class PaymentScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Submint Order',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color(0xff900c3f),
//         iconTheme: IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         leading: GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //         builder: (BuildContext context) => SubmintScreen()));
//             },
//             child: Icon(Icons.account_box, color: Colors.white)),
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: <Widget>[
//               Card(
//                   elevation: 1.0,
//                   child: Container(
//                     //color: Colors.yellow,
//                     height: MediaQuery.of(context).size.height / 2,
//                     child: Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Text(
//                                   "Thank you",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 RaisedButton(
//                                     color: Color(0xffd63447),
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Change",
//                                       style: TextStyle(color: Colors.white),
//                                     ))
//                               ]),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "Current Location.",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14.0,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 5,
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: Color(0xff900c3f),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (BuildContext context) => MyApp()));
//           },
//           child: Icon(
//             Icons.home,
//             color: Colors.white,
//           )),
//     );
//   }
// }
