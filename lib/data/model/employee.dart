import 'package:welcome_screen/domain/entity/employee_entity.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';

class Employee extends EmployeeEntity {

  Employee({
    super.id = 0,
    required super.idRole,
    required super.surname,
    required super.name,
    required super.middlename,
    required super.login,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'role_ID': idRole.id,
      'surname': surname,
      'name': name,
      'middlename': middlename,
      'login': login,
      'password': password
    };
  }

  factory Employee.toFromMap(Map<String, dynamic> json) {
    return Employee(
        id: json['ID_employee'] as int,
        surname: json['surname'],
        name: json['name'],
        middlename: json['middlename'],
        login: json['login'],
        password: json['password'],
        idRole: RoleEnum.values
            .firstWhere((element) => element.id == (json['ID_role'] as int)));
  }
}
