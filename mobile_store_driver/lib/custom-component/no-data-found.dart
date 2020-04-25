import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  NoDataFound({this.emptyTex = '', @required this.iconColor});

  String emptyTex;
  Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 1.0,
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.assistant, color: this.iconColor),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    this.emptyTex,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
