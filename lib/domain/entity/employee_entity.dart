import 'package:welcome_screen/domain/entity/role_entity.dart';

class EmployeeEntity {
  late final int id;
  final RoleEnum idRole;
  final String surname;
  final String name;
  final String middlename;
  final String login;
  final String password;

  EmployeeEntity({
    this.id = 0,
    required this.idRole,
    required this.surname,
    required this.name,
    required this.middlename,
    required this.login,
    required this.password,
  });
}
