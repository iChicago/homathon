import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_store_driver/model/driver/store_item.dart';

class RefillPage extends StatelessWidget {
  static const String ROUTE_NAME = '/refill';
  final List<StoreItem> itemsInLow = StoreItem.createDummyStoreItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
          child: Column(
            children: <Widget>[
              Text(
                'Your store is low in the following',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              buildStoreItemsScrollView(),
              buildRefillButton(),
            ],
          ),
        ));
  }

  SingleChildScrollView buildStoreItemsScrollView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        child: Column(children: <Widget>[
          buildStoreItemsCards(),
          SizedBox(
            height: 8,
          )
        ]),
      ),
    );
  }

  Column buildStoreItemsCards() {
    List<Card> itemsCards = itemsInLow
        .map((item) => new Card(
              color: Colors.green[50],
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://api.flutter.dev/flutter/static-assets/favicon.png'),
                ),
                title: Text(item.itemName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text(item.storeQuantity.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ))
        .toList();
    return Column(children: itemsCards);
  }

  AppBar buildAppBar() {
    return AppBar(
//      backgroundColor: MyApp.APP_BAR_COLOR,
      title: Text(
        'Refill Stock',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      leading: Center(child: BackButton()),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Center(child: FaIcon(FontAwesomeIcons.ellipsisH)),
        )
      ],
    );
  }

  SizedBox buildRefillButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton.icon(
        onPressed: () {},
        color: Colors.green,
        icon: Icon(
          Icons.add,
        ),
        label: Text(
          'Request to fill',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
