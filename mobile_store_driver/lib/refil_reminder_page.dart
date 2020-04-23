import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'orders.dart';

class RefillReminderPage extends StatelessWidget {
  const RefillReminderPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Order order = new Orders().getOrders()[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('Refill Suggestion'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              H1('Items'),
              SizedBox(
                height: 15,
              ),
              Column(
                  children: order.items
                      .map((item) => new Card(
                            child: ListTile(
                              leading: FlutterLogo(size: 56.0),
                              title: Text(item.itemName),
                              subtitle: Text(item.quantity.toString()),
                              trailing:
                                  Text(item.totalPrice.toString() + ' SR'),
                            ),
                          ))
                      .toList()),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  H1('Total'),
                  Text(order.total.toString() + ' SR'),
                ],
              ),
              Center(
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  textColor: Colors.blue,
                  child: Text("Back", style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
