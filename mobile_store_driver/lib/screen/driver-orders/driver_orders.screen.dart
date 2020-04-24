import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/model/driver/refill_order.dart';
import 'package:mobile_store_driver/screen/customer-order/order.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/DriverApp_CreateStoreRequest.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver-order-details.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/refill.screen.dart';

class DriverOrdersPage extends StatelessWidget {
  static const String ROUTE_NAME = '/driver-orders';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange[900],
            leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrdersPage()));
              },
              child: Icon(
                Icons.reorder, // add custom icons also
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.add_box),
                  text: 'Refill Orders',
                ),
                Tab(icon: FaIcon(FontAwesomeIcons.store), text: 'Store Orders'),
              ],
            ),
            title: Text('My Orders'),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RefillPage()));
                },
                child: Icon(
                  Icons.notifications, // add custom icons also
                ),
              )
            ],
          ),
          body: TabBarView(
            children: [
              buildRefillOrdersListView(false),
              RefillOrder.todayStoreOrder == null
                  ? MyCart()
                  : DriverOrderDetailsPage(
                      refillOrder: RefillOrder.todayStoreOrder),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildRefillOrdersListView(isStore) {
    List<RefillOrder> orders = RefillOrder.getRefillOrders(8, isStore: isStore);
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        final RefillOrder order = orders[index];
        return Column(
          children: <Widget>[
            new ListTile(
              dense: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverOrderDetailsPage(),
                    settings: RouteSettings(arguments: order),
                  ),
                );
              },
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    'Order# ${order.orderId}',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  new Text(
                    order.status,
                    style: new TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10.0,
            ),
          ],
        );
      },
    );
  }
}
