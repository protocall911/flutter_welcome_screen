import 'package:dartz/dartz.dart';
import 'package:welcome_screen/core/usecases/auth_use_case.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';
import 'package:welcome_screen/repositories/auth_repositories.dart';

class Auth implements AuthUseCase<RegistrationParams, AuthParams> {
  final AuthRepositories authRepositories;

  Auth(this.authRepositories);

  @override
  Future<Either<String, RoleEnum>> signIn(AuthParams params) async =>
      await authRepositories.signIn(params.login, params.password);

  @override
  Future<String?> signUp(RegistrationParams params) => authRepositories.signUp(
      params.role,
      params.surname,
      params.name,
      params.middlename,
      params.login,
      params.password);
}

class AuthParams {
  final String login;
  final String password;

  AuthParams(
    this.login,
    this.password,
  );
}

class RegistrationParams {
  final RoleEnum role;
  final String surname;
  final String name;
  final String middlename;
  final String login;
  final String password;

  RegistrationParams(
    this.role,
    this.surname,
    this.name,
    this.middlename,
    this.login,
    this.password,
  );
}
