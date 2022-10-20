import 'package:dartz/dartz.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';

abstract class AuthRepositories {

  String get table;

  Future<Either<String,RoleEntity>> signIn(String login, String password);
  Future<Either<String,bool>> signUp(String login, String password);
}