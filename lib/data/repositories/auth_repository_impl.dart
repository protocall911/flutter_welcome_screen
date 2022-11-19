import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:welcome_screen/common/data_base_request.dart';
import 'package:welcome_screen/core/db/data_base_helper.dart';
import 'package:welcome_screen/data/model/employee.dart';
import 'package:welcome_screen/data/model/role.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';
import 'package:welcome_screen/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.dataBase;

  @override
  String get table => DataBaseRequest.tableEmployee;

  @override
  Future<Either<String, RoleEnum>> signIn(
      String login, String password) async {
    try {
      var employee =
          (await _db.query(DataBaseRequest.tableEmployee,
              where: 'login = ?', whereArgs: [login]
          ));

      if (employee.isEmpty) return const Left('Такого пользователя нет!');

      var user = Employee.toFromMap(employee.single);

      if (user.password != password) return const Left('Неправильный пароль!');

      return Right(user.idRole);
    } on DatabaseException catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<String?> signUp(RoleEnum role, String surname, String name,
      String middlename, String login, String password) async {
    try {
      Employee user = Employee(idRole: role, surname: surname, name: name, middlename: middlename, login: login, password: password);
      await _db.insert(DataBaseRequest.tableEmployee, user.toMap());
      return null;
    } on DatabaseException catch (error) {
      if(error.isUniqueConstraintError("employee.login")) return "Пользователь с данным логином уже существует!";
      return error.toString();
    }
  }
}
