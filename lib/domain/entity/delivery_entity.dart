class DeliveryEntity {
  late int id;
  late int order;
  late int employee;
  late int status;
  final String departureDate;

  DeliveryEntity(
      {required this.id,
      required this.order,
      required this.employee,
      required this.status,
      required this.departureDate});
}
