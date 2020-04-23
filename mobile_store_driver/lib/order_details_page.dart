import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/cancel_order_page.dart';
import 'package:mobile_store_driver/gmap.dart';

import 'common_widgets.dart';
import 'orders.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order # ${order.orderId}'),
        //leading: Center(child: FaIcon(FontAwesomeIcons.arrowLeft)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Center(child: FaIcon(FontAwesomeIcons.ellipsisH)),
          )
        ],
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
              RaisedButton(
                child: Text('xxxx'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GMap(
                        latLng: order.latLng,
                      ),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CancleOrderPage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
