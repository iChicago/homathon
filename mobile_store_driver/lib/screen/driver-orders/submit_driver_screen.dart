import 'package:flutter/material.dart';

import '../../main.dart';
import 'driver_orders.screen.dart';

class SubmitDriverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Publish Order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MyApp.DRIVER_APP_COLOR,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
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
                      "Order #10024445",
                      style: TextStyle(
                        color: Color(0xffb80d57),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "You can track your order in Orders screen.",
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
                                    DriverOrdersPage()));
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
