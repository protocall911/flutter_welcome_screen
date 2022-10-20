import 'package:welcome_screen/domain/entity/employee_entity.dart';

class Employee extends EmployeeEntity {
  late int id;
  final int role;
  final String surname;
  final String name;
  final String middlename;
  final String login;
  final String password;

  Employee({
    required this.id,
    required this.role,
    required this.surname,
    required this.name,
    required this.middlename,
    required this.login,
    required this.password,
  }) : super(
      id: id,
      role: role,
      surname: surname,
      name: name,
      middlename: middlename,
      login: login,
      password: password);

  Map<String, dynamic> toMap() {
    return {
      'role_ID': role,
      'surname': surname,
      'name': name,
      'middlename': middlename,
      'login': login,
      'password': password
    };
  }

  factory Employee.toFromMap(Map<String, dynamic> json) {
    return Employee(
        id: json['ID_employee'],
        role: json['role_ID'],
        surname: json['surname'],
        name: json['name'],
        middlename: json['middlename'],
        login: json['login'],
        password: json['password']);
  }
}
