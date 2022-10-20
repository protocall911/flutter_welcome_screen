import 'package:welcome_screen/domain/entity/delivery_status_entity.dart';

class DeliveryStatus extends DeliveryStatusEntity {
  late int id;
  final String name;

  DeliveryStatus({required this.id, required this.name})
      : super(id: id, name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory DeliveryStatus.toFromMap(Map<String, dynamic> json) {
    return DeliveryStatus(id: json['ID_delivery_status'], name: json['name']);
  }
}
