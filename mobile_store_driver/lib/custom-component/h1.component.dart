import 'package:flutter/cupertino.dart';

class H1 extends StatelessWidget {
  H1(this.title);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
    );
  }
}
