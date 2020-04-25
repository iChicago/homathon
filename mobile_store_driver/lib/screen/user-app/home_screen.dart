import 'package:flutter/material.dart';
import 'package:mobile_store_driver/Model/model_index.dart';
import 'package:mobile_store_driver/core/constent.dart';
import 'package:mobile_store_driver/screen/login_page.dart';
import 'package:mobile_store_driver/screen/user-app/Widgets/index.dart';
import 'package:mobile_store_driver/screen/user-app/index.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int categoryCode = 0;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    products = prodectsIs(code: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff721b65),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CartScreen()));
                  },
                  child: new Stack(
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      DataSample.cartItems.length == null ||
                              DataSample.cartItems.length == 0
                          ? new Container()
                          : new Positioned(
                              child: new Stack(
                              children: <Widget>[
                                new Icon(Icons.brightness_1,
                                    size: 20.0, color: Color(0xffffd868)),
                                new Positioned(
                                    top: 3.0,
                                    right: 5.0,
                                    child: new Center(
                                      child: new Text(
                                        "${DataSample.cartItems.length}",
                                        textAlign: TextAlign.center,
                                        style: new TextStyle(
                                            color: Color(0xff721b65),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ],
                            )),
                    ],
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              '   ', // add custom icons also
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ListView(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 16,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DataSample.category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            products = prodectsIs(code: index);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CategoryWidget(
                            category: DataSample.category[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GridViewWidget(
                  products: products,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Product> prodectsIs({int code}) {
    List<Product> products = [];
    if (code == 0) {
      return DataSample.product;
    } else {
      for (var i in DataSample.product) {
        if (i.categoryc == code) {
          products.add(i);
        }
      }
      return products;
    }
  }
}

/*
GridView.builder(
  itemCount: 20,
  itemBuilder: (BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ProdectWidget(),
    );
  },
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: (itemWidth / itemHeight),
  ),
),

 */
