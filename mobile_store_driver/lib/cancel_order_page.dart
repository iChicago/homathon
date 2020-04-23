import 'package:flutter/material.dart';

class CancleOrderPage extends StatelessWidget {
  const CancleOrderPage({Key key}) : super(key: key);

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
