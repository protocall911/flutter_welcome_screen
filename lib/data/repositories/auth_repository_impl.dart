import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:welcome_screen/common/data_base_request.dart';
import 'package:welcome_screen/core/data_base_helper.dart';
import 'package:welcome_screen/data/model/employee.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';
import 'package:welcome_screen/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.dataBase;

  @override
  String get table => DataBaseRequest.tableEmployee;

  @override
  Future<Either<String, RoleEntity>> signIn(String login, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) {
    try {
      _db.insert(table, Employee());
    } on DatabaseException catch (error) {}
  }
}
