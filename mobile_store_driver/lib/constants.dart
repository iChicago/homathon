import 'package:flutter/cupertino.dart';

class Constants {
  static const Color DRIVER_APP_COLOR = Color(0xfff8615a);
  static const Color SUPERMARKET_APP_COLOR = Color(0xffb80d57);
  static const String STATUS_NEW = 'New';
  static const String STATUS_IN_PROGRESS = 'In Progress';
  static const String STATUS_CANCELLED = 'Cancelled';
  static const String STATUS_DELIVERED = 'Delivered';
  static const String STATUS_APPROVED = 'Approved';
  static const String ALL_ORDERS = 'All';

  static const List<String> choices = <String>[
    STATUS_NEW,
    STATUS_IN_PROGRESS,
    STATUS_CANCELLED,
    STATUS_DELIVERED,
    ALL_ORDERS
  ];

  static const List<String> orderDetailsChoices = <String>[STATUS_CANCELLED];

  static const String urgentRefill = 'High';
  static const String canWaitRefill = 'Medium';
  static const String noNeedRefill = 'Low';
  static const String allRefill = 'All';

  static const List<String> refillSortChoices = <String>[
    urgentRefill,
    canWaitRefill,
    noNeedRefill,
    allRefill
  ];
}
