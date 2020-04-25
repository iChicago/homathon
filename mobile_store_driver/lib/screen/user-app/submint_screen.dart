import 'package:flutter/material.dart';
import 'package:mobile_store_driver/model/customer/order.dart';
import 'package:mobile_store_driver/screen/user-app/index.dart';

class SubmintScreen extends StatelessWidget {
  SubmintScreen({this.order});

  Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Submint Order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff721b65),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          HomeScreen(title: 'Goot')));
            },
            child: Icon(Icons.home, color: Colors.white)),
      ),
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
                    Text(
                      "Thank you",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Order# ${order.orderId}",
                      style: TextStyle(
                        color: Color(0xffb80d57),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Your order has been sucessfully places and will be processed very soon.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                        color: Color(0xff721b65),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TrackScreen()));
                        },
                        child: Text(
                          "Track",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
