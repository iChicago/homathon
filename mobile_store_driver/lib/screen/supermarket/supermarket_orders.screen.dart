import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/model/driver/refill_order.dart';
import 'package:mobile_store_driver/screen/supermarket/storekeeper_storeI_items_screen.dart';

import '../../main.dart';
import '../driver-orders/driver_orders.screen.dart';

class SuperMarketOrdersPage extends StatelessWidget {
  static const String ROUTE_NAME = '/supermarket-orders';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyApp.DRIVER_APP_COLOR,
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DriverOrdersPage()));
              },
              child: Icon(
                Icons.home, // add custom icons also
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
          ),
          body: TabBarView(
            children: [
              buildRefillOrdersListView(false),
              buildRefillOrdersListView(true),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildRefillOrdersListView(isStore) {
    List<RefillOrder> orders;
    if (isStore) {
      orders = [RefillOrder.todayStoreOrder];
    } else {
      orders = RefillOrder.driverRefillOrders;
    }
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
                    builder: (context) => StoreKeeper(),
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
