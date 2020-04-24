class Constants {
  static const String newOrders = 'New';
  static const String inProgressOrders = 'In Progress';
  static const String cancelledOrders = 'Cancelled';
  static const String deliveredOrders = 'Delivered';
  static const String allOrders = 'All';

  static const List<String> choices = <String>[
    newOrders,
    inProgressOrders,
    cancelledOrders,
    deliveredOrders,
    allOrders
  ];

  static const String cancleOrder = 'Cancle';

  static const List<String> orderDetailsChoices = <String>[cancleOrder];
}
