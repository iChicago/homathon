import 'package:flutter/material.dart';
import 'package:mobile_store_driver/screen/customer-order/order-details.screen.dart';
import 'package:mobile_store_driver/screen/customer-order/order.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver-order-details.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/driver_orders.screen.dart';
import 'package:mobile_store_driver/screen/driver-orders/refill.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String CANCEL_SCREEN_ROUTE = '/home';
  static const String MAP_SCREEN_ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange[900]),
      debugShowCheckedModeBanner: false,
      home: DriverOrdersPage(),
      routes: {
        OrdersPage.ROUTE_NAME: (context) => OrdersPage(),
        OrderDetailsPage.ROUTE_NAME: (context) => OrderDetailsPage(),
        RefillPage.ROUTE_NAME: (context) => RefillPage(),
        DriverOrdersPage.ROUTE_NAME: (context) => DriverOrdersPage(),
        DriverOrderDetailsPage.ROUTE_NAME: (context) =>
            DriverOrderDetailsPage(),
      },
    );
  }
}
