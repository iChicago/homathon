import 'package:flutter/material.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/custom-component/h1.component.dart';
import 'package:mobile_store_driver/model/data_sample.dart';
import 'package:mobile_store_driver/model/product.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({
    Key key,
  }) : super(key: key);

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  static List<Product> backupItems = DataSample.products;
  List<Product> items = [...backupItems];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.DRIVER_APP_COLOR,
          title: Text('Inventory'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.refillSortChoices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child:
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    H1('Items'),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...items
                            .map(
                              (item) =>
                          new Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text(item.name)),
                                  Chip(
                                    label: Text(item.remaining.toString() +
                                        '/' +
                                        item.stock.toString()),
                                    backgroundColor: _itemStatusColor(
                                        item.remaining, item.stock),
                                  )
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        )
                            .toList(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  void choiceAction(String choice) {
    setState(() {
      if (choice == Constants.ALL_ORDERS) {
        items = backupItems;
      } else {
        items =
            backupItems.where((i) => _itemsSortDecision(i, choice)).toList();
      }
    });
  }

  bool _itemsSortDecision(Product i, String choice) {
    print(choice);
    double percentage = i.remaining / i.stock;
    print(percentage);
    if (choice == Constants.noNeedRefill) {
      return (percentage >= 0.8);
    }
    if (choice == Constants.canWaitRefill) {
      return (percentage < 0.8 && percentage >= 0.5);
    }
    if (choice == Constants.urgentRefill) {
      return (percentage < 0.5);
    }
    return false;
  }

  Color _itemStatusColor(int remaining, int quantity) {
    double percentage = remaining / quantity;
    if (percentage >= 0.8) {
      return Colors.green.shade400;
    } else if (percentage < 0.8 && percentage >= 0.5) {
      return Colors.orange.shade600;
    } else {
      return Colors.red.shade400;
    }
  }
}
