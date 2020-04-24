import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/orders.dart';
import 'package:mobile_store_driver/refil_reminder_page.dart';

import 'constants.dart';
import 'order_details_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: OrdersPage(),
    );
  }
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> backupOrders = new Orders().getOrders();
  List<Order> orders = new Orders().getOrders();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.store),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RefillReminderPage()));
        },
      ),
      appBar: AppBar(
        title: Center(child: Text('Customer Orders')),
        leading: GestureDetector(
          child: Center(
            child: Stack(
              children: <Widget>[
                new Icon(Icons.notifications),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                MaterialPageRoute(builder: (context) => RefillReminderPage()));
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrderDetailsPage(order: orders[index]),
                    ),
                  );
                },
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      'Order# ${orders[index].orderId}',
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '${orders[index].distance} km',
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    orders[index].status,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
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
    setState(() {
      if (choice == Constants.allOrders) {
        orders = backupOrders;
      } else {
        orders =
            backupOrders.where((o) => o.status.startsWith(choice)).toList();
      }
    });
  }
}
