import 'package:welcome_screen/domain/entity/order_entity.dart';

class Order extends OrderEntity {
  late int id;
  final int client;
  final String placementDate;
  final String postcode;
  final String city;
  final String address;
  final String trackCode;

  Order({
    required this.id,
    required this.client,
    required this.placementDate,
    required this.postcode,
    required this.city,
    required this.address,
    required this.trackCode,
  }) : super(
      id: id,
      client: client,
      placementDate: placementDate,
      postcode: postcode,
      city: city,
      address: address,
      trackCode: trackCode);

  Map<String, dynamic> toMap() {
    return {
      'client_ID': client,
      'placement_date': placementDate,
      'postcode': postcode,
      'city': city,
      'address': address,
      'track_code': trackCode
    };
  }

  factory Order.toFromMap(Map<String, dynamic> json) {
    return Order(
        id: json['ID_order'],
        client: json['client_ID'],
        placementDate: json['placement_date'],
        postcode: json['postcode'],
        city: json['city'],
        address: json['address'],
        trackCode: json['track_code']);
  }
}
