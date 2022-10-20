import 'dart:convert';

import 'package:welcome_screen/domain/entity/delivery_entity.dart';

class Delivery extends DeliveryEntity {
  late int id;
  late int order;
  late int employee;
  late int status;
  final String departureDate;

  Delivery(
      {required this.id,
      required this.order,
      required this.employee,
      required this.status,
      required this.departureDate})
      : super(
            id: id,
            order: order,
            employee: employee,
            status: status,
            departureDate: departureDate);

  Map<String, dynamic> toMap() {
    return {
      'order_ID': order,
      'employee_ID': employee,
      'delivery_status_ID': status,
      'departure_date': departureDate
    };
  }

  factory Delivery.toFromMap(Map<String, dynamic> json) {
    return Delivery(
        id: json['ID_delivery'],
        order: json['order_ID'],
        employee: json['employee_ID'],
        status: json['delivery_status_ID'],
        departureDate: json['departure_date']);
  }
}
