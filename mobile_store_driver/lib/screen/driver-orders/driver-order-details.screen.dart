import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store_driver/constants.dart';
import 'package:mobile_store_driver/custom-component/status_component.dart';
import 'package:mobile_store_driver/model/driver/refill_order.dart';

import '../../constants.dart';

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
        centerTitle: true,
        backgroundColor: Constants.DRIVER_APP_COLOR,
        title: Text(
          'Order# ' + this.refillOrder.orderId.toString(),
          style: TextStyle(fontStyle: FontStyle.italic),
        ));
  }

  SingleChildScrollView buildBody(context) {
    bool isStatusInPorgress =
        this.refillOrder.status == Constants.STATUS_IN_PROGRESS;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StatusWidget(
                  status: this.refillOrder.status,
                  statusColor:
                      isStatusInPorgress ? Colors.yellow[800] : Colors.green),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Items',
                  style: TextStyle(fontSize: 20, color: Color(0xffb80d57)),
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
              elevation: 1.0,
              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    flex: 8,
                    child: Text(item.itemName,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 15,
                      child: Text(item.storeQuantity.toString(),
                          style: TextStyle(
                            color: Color(0xff721b65),
                            fontSize: 20,
                          )),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ]),
              ),
            ))
        .toList();
    return Column(children: itemsCards);
  }

  Widget getCartTotalWidget(context) {
    if (Constants.STATUS_APPROVED == this.refillOrder.status ||
        Constants.STATUS_DELIVERED == this.refillOrder.status) {
      return Card(
        elevation: 1.0,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                refillOrder.isStore ? 'Store Details' : 'Supplier Details',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xffb80d57)),
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
                    fontSize: 20,
                    color: Color(0xfff8615a)),
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
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            this.refillOrder.supplier.name,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff721b65),
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
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              DateFormat("dd-MM-yyyy hh:mm aaa")
                  .format(this.refillOrder.availabilityTime),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
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
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            this.refillOrder.supplierRemarks,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
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
            style: TextStyle(fontSize: 18, color: Colors.grey),
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
            elevation: 0.0,
            onPressed: () {},
            color: Color(0xffffd868),
            icon: Icon(
              Icons.map,
              color: Colors.white,
            ),
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
            elevation: 0.0,
            onPressed: () {},
            color: Color(0xfff8615a),
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
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
