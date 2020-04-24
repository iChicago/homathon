import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.payment,
                              color: Color(0xff721b65),
                            ),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff721b65)),
                            ),
                          ],
                        ),
                        RaisedButton(
                            color: Colors.transparent,
                            elevation: 0.0,
                            onPressed: () {},
                            child: Text(
                              "Change",
                              style: TextStyle(color: Color(0xffd63447)),
                            ))
                      ]),
                  Padding(padding: EdgeInsets.all(8.0), child: new Divider()),
                  Text(
                    "Apple pay.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
