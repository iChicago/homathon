import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/custom-component/status_component.dart';
import 'package:mobile_store_driver/model/driver/refill_order.dart';

import '../../constants.dart';
import '../../main.dart';

class DriverOrderDetailsPage extends StatelessWidget {
  static const String ROUTE_NAME = '/refill-order-details';

  DriverOrderDetailsPage({this.refillOrder});

  RefillOrder refillOrder;

  @override
  Widget build(BuildContext context) {
    if (this.refillOrder == null) {
      this.refillOrder =
          ModalRoute.of(context).settings.arguments as RefillOrder;
    }
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Constants.DRIVER_APP_COLOR,
      title: Text(
        'Order# ' + this.refillOrder.orderId.toString(),
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      leading: Center(child: BackButton()),
    );
  }

  SingleChildScrollView buildBody(context) {
    bool isStatusInPorgress = this.refillOrder.status == Constants.STATUS_IN_PROGRESS;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StatusWidget(status: this.refillOrder.status, statusColor:  isStatusInPorgress? Colors.yellow[800]: Colors.green),
              SizedBox(
                height: 8,
              ),
              Text(
                'Items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              buildItemsCards(),
              SizedBox(
                height: 8,
              ),
              getCartTotalWidget(context),
              SizedBox(
                height: 8,
              ),
            ]),
      ),
    );
  }

  Column buildItemsCards() {
    List<Card> itemsCards = refillOrder.storeItems
        .map((item) => new Card(
              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              color: Colors.green[50],
              child: Row(children: [
                Expanded(
                  flex: 8,
                  child: Text(item.itemName,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 10,
                    child: Text(item.storeQuantity.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.white,
                  ),
                ),
              ]),
            ))
        .toList();
    return Column(children: itemsCards);
  }

  Widget getCartTotalWidget(context) {
    if (Constants.STATUS_APPROVED == this.refillOrder.status ||
        Constants.STATUS_DELIVERED == this.refillOrder.status) {
      return Card(
        color: Colors.amber[50],
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 2.0, 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                refillOrder.isStore ? 'Store Details' : 'Supplier Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 5),
              supplierName(),
              deliveryTime(),
              SizedBox(height: 5),
              deliveryRemarks(),
              Divider(
                height: 5,
                thickness: 2,
              ),
              Text(
                'Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              orderAddress(),
              SizedBox(height: 20),
              orderActionButtons(context),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(height: 5);
    }
  }

  /// Build Supplier name row
  Row supplierName() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            'Name',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            this.refillOrder.supplier.name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget deliveryTime() {
    if (!this.refillOrder.isStore) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Text(
              'Availability Time',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              DateFormat("dd-MM-yyyy hh:mm aaa")
                  .format(this.refillOrder.availabilityTime),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    } else {
      return SizedBox(height: 5);
    }
  }

  Row deliveryRemarks() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            'Remarks',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            this.refillOrder.supplierRemarks,
            style: TextStyle(
              fontSize: 20,
              color: Colors.brown[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  /// Build order address row
  Row orderAddress() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            refillOrder.supplier.address,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Row orderActionButtons(context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: RaisedButton.icon(
            onPressed: () {},
            color: Colors.green[500],
            icon: Icon(Icons.map),
            label: Text(
              'Map',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton.icon(
            onPressed: () {},
            color: Colors.blue,
            icon: Icon(Icons.phone),
            label: Text(
              'Call',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
