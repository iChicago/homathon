import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/custom-component/no-data-found.dart';
import 'package:mobile_store_driver/model/customer/order.dart';
import 'package:mobile_store_driver/screen/customer-order/order-details.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver_orders.screen.dart';
import 'package:mobile_store_driver/screen/inventory/inventory_page.dart';

class OrdersPage extends StatefulWidget {
  static const String ROUTE_NAME = '/driver_orders';

  const OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> backupOrders = Order.list;
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
        backgroundColor: Color(0xfff8615a),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InventoryPage()));
        },
      ),
      appBar: AppBar(
        backgroundColor: Constants.DRIVER_APP_COLOR,
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
      body: buildOrderListItems(),
    );
  }

  Widget buildOrderListItems() {
    if (orders.isNotEmpty) {
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return getItemListTile(index);
        },
      );
    } else {
      return Row(children: <Widget>[
        Expanded(
          child: NoDataFound(
            emptyTex: 'No Customers Orders',
            iconColor: Constants.DRIVER_APP_COLOR,
          ),
        ),
      ]);
    }
  }

  Widget getItemListTile(index) {
    if (orders.isNotEmpty) {
      final order = orders[index];
      bool isStatusInProgress = order.status == Constants.STATUS_IN_PROGRESS;
      return Column(
        children: <Widget>[
          new ListTile(
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailsPage(),
                  settings: RouteSettings(arguments: order),
                ),
              );
            },
            title: new Card(
              elevation: 1.5,
              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: [
                  Expanded(
                    flex: 5,
                    child: Text('Order# ${order.orderId}',
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff721b65))),
                  ),
                  Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      radius: 15,
                      child: new Text(
                        order.status,
                        style: new TextStyle(
                            color: isStatusInProgress
                                ? Colors.yellow[800]
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text('${order.distance} km',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ),
                ]),
              ),
            ),
          ),
          Divider(
            height: 10.0,
          ),
        ],
      );
    }
    return Container();
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
