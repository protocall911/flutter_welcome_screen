import 'package:welcome_screen/domain/entity/product_entity.dart';

class Product extends ProductEntity {
  late int id;
  final String name;
  late int category;
  final String color;
  final String material;
  late int price;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.color,
      required this.material,
      required this.price})
      : super(
            id: id,
            name: name,
            category: category,
            color: color,
            material: material,
            price: price);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'product_category_ID': category,
      'color': color,
      'material': material,
      'price': price
    };
  }

  factory Product.toFromMap(Map<String, dynamic> json) {
    return Product(
        id: json['ID_product'],
        name: json['name'],
        category: json['product_category_ID'],
        color: json['color'],
        material: json['material'],
        price: json['price']);
  }
}
