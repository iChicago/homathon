import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/model/driver/refill_order.dart';
import 'package:mobile_store_driver/screen/login_page.dart';
import 'package:mobile_store_driver/screen/supermarket/supermarket_order_items_details.dart';

import '../../constants.dart';

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
            centerTitle: true,
            backgroundColor: Constants.SUPERMARKET_APP_COLOR,
            leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                '_',
                style: TextStyle(height: 50), // add custom icons also
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
              indicatorColor: Color(0xffffd868),
              indicatorWeight: 4.0,
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
        bool isStatusInProgress = order.status == Constants.STATUS_IN_PROGRESS;
        if (order != null) {
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
//              Divider(
//                height: 10.0,
//              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
