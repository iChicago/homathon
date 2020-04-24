import 'package:flutter/material.dart';
import 'package:mobile_store_driver/screen/supermarket/supermarket_orders.dart';

import '../../constants.dart';

class SubmitStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Accepted Order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Constants.SUPERMARKET_APP_COLOR,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            elevation: 1.0,
            child: Container(
              //color: Colors.yellow,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Thank you",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Order #10024445",
                      style: TextStyle(
                        color: Color(0xffb80d57),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Thank for approving the request.",
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
                      color: Color(0xffb80d57),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SuperMarketOrdersPage()));
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
