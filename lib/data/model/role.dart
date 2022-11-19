import 'package:welcome_screen/domain/entity/role_entity.dart';

class Role extends RoleEntity {
  Role({super.id, required super.role});

  Map<String, dynamic> toMap() => {
    "ID_role": id,
    "role": role
  };

  factory Role.fromMap(Map<String, dynamic> json) => Role(id: json["ID_role"], role: json["role"]);
}
