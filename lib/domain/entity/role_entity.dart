class RoleEntity {
  late final int id;
  final String role;
  RoleEntity({this.id = 0, required this.role});
}

enum RoleEnum {
  admin(1, 'Администратор'),
  user(2, 'Пользователь');

  const RoleEnum(this.id, this.name,);
  final String name;
  final int id;
}

