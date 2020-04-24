import 'package:flutter/material.dart';
import 'package:mobile_store_driver/screen/user-app/home_screen.dart';

class TrackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Track Order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff721b65),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          HomeScreen(title: 'Goot')));
            },
            child: Icon(Icons.home, color: Colors.white)),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Card(
                    elevation: 1.0,
                    child: Container(
                      //height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Wed,12 Sep",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Order #10024445",
                                          style: TextStyle(
                                            color: Color(0xffb80d57),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text("Total: 354 SR",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "ETA: 2:00 Houre",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xfff8615a),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.move_to_inbox,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Wed,12 Sep",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Pindding",
                                              style: TextStyle(
                                                color: Color(0xffb80d57),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        Text("11:00 PM",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      //child:
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xfff8615a),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.local_mall,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Wed,12 Sep",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Under processing",
                                              style: TextStyle(
                                                color: Color(0xffb80d57),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text("11:30 PM",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      //child:
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.local_shipping,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Wed,12 Sep",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              "On the way",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        Text("12:00 PM",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      //child:
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.insert_emoticon,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Wed,12 Sep",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              "Complete",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        Text("1:00 PM",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                Card(
                    elevation: 1.0,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              //child:
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xffffd868),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Delivery Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "6141 King Fahd Branch Rd, \nAl Wurud, Riyadh 12215",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ])
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
