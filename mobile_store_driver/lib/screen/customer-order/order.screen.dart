import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/model/customer/orders.dart';
import 'package:mobile_store_driver/screen/customer-order/order-details.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver_orders.screen.dart';
import 'package:mobile_store_driver/screen/inventory/inventory_page.dart';

import '../../main.dart';

class OrdersPage extends StatefulWidget {
  static const String ROUTE_NAME = '/home';

  const OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> backupOrders = Order.getOrders(15);
  List<Order> orders;

  _OrdersPageState() {
    this._loadNewAndInProgressOrders();
  }

  _loadNewAndInProgressOrders() {
    orders = backupOrders
        .where((o) =>
            o.status.startsWith(Constants.STATUS_NEW) ||
            o.status.startsWith(Constants.STATUS_IN_PROGRESS))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.store),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InventoryPage()));
        },
      ),
      appBar: AppBar(
        backgroundColor: MyApp.DRIVER_APP_COLOR,
        title: Center(child: Text('Customers Orders')),
        leading: GestureDetector(
          child: Center(
            child: Stack(
              children: <Widget>[
                new Icon(Icons.home),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DriverOrdersPage()));
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              new ListTile(
                dense: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsPage(),
                      settings: RouteSettings(arguments: orders[index]),
                    ),
                  );
                },
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      'Order# ${orders[index].orderId}',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    new Text(
                      '${orders[index].distance} km',
                      style: new TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    orders[index].status,
                    style: new TextStyle(color: Colors.green, fontSize: 15.0),
                  ),
                ),
              ),
              Divider(
                height: 10.0,
              ),
            ],
          );
        },
      ),
    );
  }

  void choiceAction(String choice) {
    print(choice);
    setState(() {
      if (choice == Constants.ALL_ORDERS) {
        orders = backupOrders;
      } else {
        orders =
            backupOrders.where((o) => o.status.startsWith(choice)).toList();
      }
    });
  }
}
