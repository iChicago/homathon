import 'package:flutter/material.dart';

import 'constants.dart';
import 'orders.dart';

class CancleOrderPage extends StatefulWidget {
  final Order order;
  const CancleOrderPage({Key key, this.order}) : super(key: key);

  @override
  _CancleOrderPageState createState() => _CancleOrderPageState();
}

class _CancleOrderPageState extends State<CancleOrderPage> {
  @override
  Widget build(BuildContext context) {
    const List<String> cancellationReasons = [
      'Customer didn\'t respond',
      'Some items were damaged',
      'Could\'nt reach the destination',
      'Customer asked to cancel',
      'Other',
    ];
    return Scaffold(
      appBar: AppBar(
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
                        widget.order.status = Constants.cancelledOrders;
                        Navigator.pop(context);
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
