class ProductEntity {
  late int id;
  final String name;
  late int category;
  final String color;
  final String material;
  late int price;

  ProductEntity(
      {required this.id,
      required this.name,
      required this.category,
      required this.color,
      required this.material,
      required this.price});
}
