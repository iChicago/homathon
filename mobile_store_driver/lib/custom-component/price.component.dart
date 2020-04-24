import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget({this.price, this.currency = ' SR ', this.fontSize = 15});

  final double price;
  String currency;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        currency,
        style: TextStyle(
          fontSize: 10,
          color: Colors.brown[700],
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        price.toString(),
        style: TextStyle(
          fontSize: this.fontSize,
          color: Colors.brown[700],
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
