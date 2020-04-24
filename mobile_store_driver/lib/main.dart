import 'package:flutter/material.dart';
import 'package:mobile_store_driver/screen/customer-order/order-details.screen.dart';
import 'package:mobile_store_driver/screen/customer-order/order.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver-order-details.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver_orders.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/refill.screen.dart';
import 'package:mobile_store_driver/screen/login_page.dart';
import 'package:mobile_store_driver/screen/supermarket/supermarket_orders.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Constants.DRIVER_APP_COLOR),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        LoginPage.ROUTE_NAME: (context) => LoginPage(),
        OrdersPage.ROUTE_NAME: (context) => OrdersPage(),
        OrderDetailsPage.ROUTE_NAME: (context) => OrderDetailsPage(),
        RefillPage.ROUTE_NAME: (context) => RefillPage(),
        DriverOrdersPage.ROUTE_NAME: (context) => DriverOrdersPage(),
        DriverOrderDetailsPage.ROUTE_NAME: (context) =>
            DriverOrderDetailsPage(),
        SuperMarketOrdersPage.ROUTE_NAME: (context) =>
            DriverOrderDetailsPage(),
      },
    );
  }
}
