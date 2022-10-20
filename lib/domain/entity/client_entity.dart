class ClientEntity {
  late int id;
  final String surname;
  final String name;
  final String middlename;
  final String email;
  final String phone;

  ClientEntity(
      {required this.id,
      required this.surname,
      required this.name,
      required this.middlename,
      required this.email,
      required this.phone});
}
