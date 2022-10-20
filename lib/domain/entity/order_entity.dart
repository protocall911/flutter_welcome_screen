class OrderEntity {
  late int id;
  final int client;
  final String placementDate;
  final String postcode;
  final String city;
  final String address;
  final String trackCode;

  OrderEntity({
    required this.id,
    required this.client,
    required this.placementDate,
    required this.postcode,
    required this.city,
    required this.address,
    required this.trackCode,
  });
}
