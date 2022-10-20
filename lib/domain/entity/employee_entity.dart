class EmployeeEntity {
  late int id;
  final int role;
  final String surname;
  final String name;
  final String middlename;
  final String login;
  final String password;

  EmployeeEntity({
    required this.id,
    required this.role,
    required this.surname,
    required this.name,
    required this.middlename,
    required this.login,
    required this.password,
  });
}
