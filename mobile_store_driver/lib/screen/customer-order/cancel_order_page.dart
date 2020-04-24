import 'package:flutter/material.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/model/customer/orders.dart';
import 'package:mobile_store_driver/screen/customer-order/order.screen.dart';

import '../../main.dart';

class CancleOrderPage extends StatelessWidget {
  Order order;

  @override
  Widget build(BuildContext context) {
    this.order = ModalRoute.of(context).settings.arguments as Order;
    const List<String> cancellationReasons = [
      'Customer didn\'t respond',
      'Some items were damaged',
      'Could\'nt reach the destination',
      'Customer asked to cancel',
      'Other',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyApp.DRIVER_APP_COLOR,
        title: Text('Cancellation reason'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...cancellationReasons
                .map(
                  (item) => new Card(
                    child: ListTile(
                      title: Text(item),
                      onTap: () {
                        this.order.status = Constants.STATUS_CANCELLED;
                        this.order.cancellationReason = item;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrdersPage()));
                      },
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
