import 'package:welcome_screen/domain/entity/size_entity.dart';

class Size extends SizeEntity {
  late int id;
  late int product;
  final String name;

  Size({required this.id, required this.product, required this.name})
      : super(id: id, product: product, name: name);

  Map<String, dynamic> toMap() {
    return {'ID_product': product, 'name': name};
  }

  factory Size.toFromMap(Map<String, dynamic> json) {
    return Size(
        id: json['ID_size'], product: json['ID_product'], name: json['name']);
  }
}
