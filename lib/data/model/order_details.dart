import 'package:welcome_screen/domain/entity/order_details_entity.dart';

class OrderDetails extends OrderDetailsEntity {
  late int id;
  late int product;
  late int order;
  late int quantity;

  OrderDetails(
      {required this.id,
      required this.product,
      required this.order,
      required this.quantity})
      : super(id: id, product: product, order: order, quantity: quantity);

  Map<String, dynamic> toMap() {
    return {'product_ID': product, 'order_ID': order, 'quantity': quantity};
  }

  factory OrderDetails.toFromMap(Map<String, dynamic> json) {
    return OrderDetails(
        id: json['ID_order_details'],
        product: json['product_ID'],
        order: json['order_ID'],
        quantity: json['quantity']);
  }
}
