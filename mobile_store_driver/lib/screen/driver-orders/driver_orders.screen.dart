import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/model/driver/refill_order.dart';
import 'package:mobile_store_driver/screen/customer-order/order.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/DriverApp_CreateStoreRequest.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver-order-details.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/refill.screen.dart';
import 'package:mobile_store_driver/screen/login_page.dart';

import '../../constants.dart';

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
            centerTitle: true,
            backgroundColor: Constants.DRIVER_APP_COLOR,
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
              indicatorColor: Color(0xffb80d57),
              indicatorWeight: 4.0,
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  '_',
                  style: TextStyle(height: 50), // add custom icons also
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

  static ListView buildRefillOrdersListView(isStore) {
    List<RefillOrder> orders = RefillOrder.driverRefillOrders;
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        final RefillOrder order = orders[index];
        bool isStatusInProgress = order.status == Constants.STATUS_IN_PROGRESS;
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
                        color: isStatusInProgress
                            ? Colors.yellow[800]
                            : Colors.green,
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
