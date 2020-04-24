import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  CustomAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {},
                child: new Stack(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                    0 == 0
                        ? new Container()
                        : new Positioned(
                            child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange),
                              new Positioned(
                                  top: 3.0,
                                  right: 4.0,
                                  child: new Center(
                                    child: new Text(
                                      "0",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                  ],
                ),
              )),
        )
      ],
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xff900c3f),
    );
  }
}
