import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/custom-component/h1.component.dart';
import 'package:mobile_store_driver/model/customer/orders.dart';
import 'package:mobile_store_driver/screen/customer-order/cancel_order_page.dart';
import 'package:mobile_store_driver/screen/gmap/gmap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class OrderDetailsPage extends StatefulWidget {
  static const String ROUTE_NAME = '/order-details';

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  Order order;

  @override
  Widget build(BuildContext context) {
    this.order = ModalRoute.of(context).settings.arguments as Order;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.DRIVER_APP_COLOR,
        title: Text('Order # ${order.orderId}'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.orderDetailsChoices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              offset: Offset(0, 100),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  H1('Items'),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...order.items
                          .map(
                            (item) => new Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        child: Text(item.quantity.toString()),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(child: Text(item.itemName)),
                                    Text(item.totalPrice.toString()),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          )
                          .toList(),
                      SizedBox(
                        height: 30,
                      ),
                      H1('Total'),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Items price'),
                          Text(order.orderTotal.toString() + ' SR'),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('VAT 5%'),
                          Text((order.orderTotal * 0.05).toStringAsFixed(2) +
                              ' SR'),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Delivery',
                          ),
                          Text(
                            '10 SR',
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total Price',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ((order.orderTotal * 0.05) + order.orderTotal + 10)
                                    .toStringAsFixed(2) +
                                ' SR',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      H1('Order Status'),
                      SizedBox(
                        height: 5,
                      ),
                      Chip(
                        label: Text(order.status),
                        backgroundColor: _choiceStatusColor(order.status),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      if (_showAcceptButton(order.status))
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  order.status = Constants.STATUS_IN_PROGRESS;
                                });
                              },
                              child: NMButton(
                                icon: FontAwesomeIcons.check,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GMap(
                                order: order,
                              ),
                            ),
                          );
                        },
                        child: NMButton(
                          icon: FontAwesomeIcons.mapMarker,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL();
                        },
                        child: NMButton(
                          icon: FontAwesomeIcons.phoneAlt,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'tel:+966555555555';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void choiceAction(String choice) {
    if (choice == Constants.STATUS_CANCELLED) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CancleOrderPage(),
            settings: RouteSettings(arguments: this.order),
          ),
        );
      });
    }
  }

  bool _showAcceptButton(String status) {
    if (status == Constants.STATUS_NEW) {
      return true;
    }
    return false;
  }

  Color _choiceStatusColor(String status) {
    if (status == Constants.STATUS_NEW) {
      return Colors.yellow.shade600;
    }
    if (status == Constants.STATUS_IN_PROGRESS) {
      return Colors.blue.shade400;
    }
    if (status == Constants.STATUS_CANCELLED) {
      return Colors.red;
    }
    if (status == Constants.STATUS_DELIVERED) {
      return Colors.green.shade600;
    }
    return Colors.grey;
  }
}

class NMButton extends StatelessWidget {
  final Color color;
  final IconData icon;

  const NMButton({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.075),
              offset: Offset(10, 10),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-10, -10),
              blurRadius: 10,
            ),
          ]),
      child: Icon(
        icon,
        color: color ?? Colors.grey.shade600,
      ),
    );
  }
}
