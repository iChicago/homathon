import 'package:flutter/material.dart';
import 'package:mobile_store_driver/screen/supermarket/supermarket_orders.dart';
import 'package:mobile_store_driver/screen/user-app/home_screen.dart';
import 'customer-order/order.screen.dart';
import 'driver-orders/driver_orders.screen.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE_NAME = '/home';

  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final loginButonAsStoreOwner = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuperMarketOrdersPage()));
        },
        child: Text("Login as Store Owner",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color(0xffb80d57), fontWeight: FontWeight.bold)),
      ),
    );
    final loginButonAsDriver = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OrdersPage()));
        },
        child: Text("Login as Driver",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color(0xfff8615a), fontWeight: FontWeight.bold)),
      ),
    );
    final loginButonAsCustomer = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(title: 'Goot')));
        },
        child: Text("Login as Customer",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color(0xff721b65), fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff721b65), Color(0xfff8615a), Color(0xffffd868)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                loginButonAsCustomer,
                SizedBox(height: 25.0),
                loginButonAsDriver,
                SizedBox(
                  height: 25.0,
                ),
                loginButonAsStoreOwner,
                // SizedBox(
                //   height: 15.0,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
