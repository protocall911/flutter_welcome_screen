import 'package:welcome_screen/domain/entity/product_category_entity.dart';

class ProductCategory extends ProductCategoryEntity {
  late int id;
  final String name;

  ProductCategory({required this.id, required this.name})
      : super(id: id, name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory ProductCategory.toFromMap(Map<String, dynamic> json) {
    return ProductCategory(id: json['ID_product_category'], name: json['name']);
  }
}
