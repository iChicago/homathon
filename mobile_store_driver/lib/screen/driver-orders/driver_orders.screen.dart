import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/custom-component/no-data-found.dart';
import 'package:mobile_store_driver/model/data_sample.dart';
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
                Icons.arrow_back, // add custom icons also
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.add_box),
                  text: 'Refill Orders',
                ),
                Tab(icon: FaIcon(FontAwesomeIcons.store), text: 'Store Order'),
              ],
              indicatorColor: Color(0xffb80d57),
              indicatorWeight: 4.0,
            ),
            title: Text('My Orders'),
            actions: <Widget>[
              _viewNotificationIcon(context),
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

  static Widget buildRefillOrdersListView(isStore) {
    List<RefillOrder> orders = RefillOrder.driverRefillOrders;
    if (orders.length == 0) {
      return NoDataFound(
        emptyTex: 'No refill orders',
        iconColor: Constants.DRIVER_APP_COLOR,
      );
    } else {
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          final RefillOrder order = orders[index];
          bool isStatusInProgress =
              order.status == Constants.STATUS_IN_PROGRESS;
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
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff721b65))),
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
                    ]),
                  ),
                ),
              ),
//            Divider(
//              height: 10.0,
//            ),
            ],
          );
        },
      );
    }
  }

  Widget _viewNotificationIcon(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RefillPage()));
      },
      child: Container(
//        width: 30,
//        height: 30,
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
//            color: Colors.black,
              size: 30,
            ),
            viewNotificationCount(),
          ],
        ),
      ),
    );
  }

  Container viewNotificationCount() {
    if (DataSample.itemsToBeRefilled.isEmpty) {
      return Container();
    }
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 5),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(color: Colors.white, width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Text(
              '1',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
