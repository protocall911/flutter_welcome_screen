import 'package:welcome_screen/domain/entity/client_entity.dart';

class Client extends ClientEntity {
  late int id;
  final String surname;
  final String name;
  final String middlename;
  final String email;
  final String phone;

  Client({
    required this.id,
    required this.surname,
    required this.name,
    required this.middlename,
    required this.email,
    required this.phone,
  }) : super(
      id: id,
      surname: surname,
      name: name,
      middlename: middlename,
      email: email,
      phone: phone);

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'middlename': middlename,
      'email': email,
      'phone': phone
    };
  }

  factory Client.toFromMap(Map<String, dynamic> json) {
    return Client(
        id: json['ID_client'],
        surname: json['surname'],
        name: json['name'],
        middlename: json['middlename'],
        email: json['email'],
        phone: json['phone']);
  }
}
