import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  StatusWidget(
      {this.status,
      this.statusColor = Colors.green,
      this.cancellationReason = null});

  final String status;
  final String cancellationReason;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 2.0, 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Text(
                    'Order Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    this.status,
                    style: TextStyle(
                      fontSize: 15,
                      color: this.statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            this.cancellationReason != null
                ? Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Cancel Reason',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          this.cancellationReason,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                : Row(),
          ],
        ),
      ),
    );
  }
}
