import 'package:flutter/material.dart';
import 'package:mobile_store_driver/screen/customer-order/order-details.screen.dart';
import 'package:mobile_store_driver/screen/customer-order/order.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver-order-details.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver_orders.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/refill.screen.dart';
import 'package:mobile_store_driver/screen/supermarket/supermarket_orders.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String CANCEL_SCREEN_ROUTE = '/home';
  static const String MAP_SCREEN_ROUTE = '/home';
  static const Color DRIVER_APP_COLOR = Color(0xfff8615a);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: DRIVER_APP_COLOR),
      debugShowCheckedModeBanner: false,
      home: DriverOrdersPage(),
      routes: {
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
