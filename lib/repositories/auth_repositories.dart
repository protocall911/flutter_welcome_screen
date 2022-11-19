import 'package:dartz/dartz.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';

abstract class AuthRepositories {
  String get table;

  Future<Either<String,RoleEnum>> signIn(String login, String password);
  Future<String?> signUp(RoleEnum role, String surname, String name,
      String middlename, String login, String password);
}